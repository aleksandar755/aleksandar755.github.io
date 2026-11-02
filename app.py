from flask import Flask, render_template, request, redirect, url_for, session
from database import connect_db  
import datetime                  

app = Flask(__name__)
app.secret_key = 'ftn_ip_2026' 

# --- POČETNA STRANA ---
@app.route('/')
def index():
    return render_template('index.html')

# --- REGISTRACIJA ---
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        db = connect_db()
        cursor = db.cursor()
        cursor.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)", 
                       (request.form['username'], request.form['email'], request.form['password']))
        db.commit()              
        cursor.close()
        db.close()
        return redirect(url_for('login')) 
    return render_template('register.html')

# --- PRIJAVA (LOGIN) ---
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        db = connect_db()
        cursor = db.cursor(dictionary=True) # Omogućava da pristupamo kolonama po imenu
        cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
        user = cursor.fetchone() 
        cursor.close()
        db.close()
        
        if user:
            # Ako korisnik postoji, "pamti" ga u sesiji pretraživača
            session['user_id'] = user['id']
            session['username'] = user['username']
            return redirect(url_for('index')) 
        else:
            return "Pogrešno ime ili lozinka!" 
            
    return render_template('login.html')

# --- ODJAVA (LOGOUT) ---
@app.route('/logout')
def logout():
    session.clear() 
    return redirect(url_for('index'))

# --- KVIZ (PRIKAZ PITANJA) ---
@app.route('/quiz')
def quiz():
    if 'user_id' not in session: 
        return redirect(url_for('login'))
    
    kategorija = request.args.get('cat') 
    db = connect_db()
    cursor = db.cursor(dictionary=True)
    
   
    if kategorija:
        cursor.execute("SELECT * FROM questions WHERE category=%s ORDER BY RAND() LIMIT 10", (kategorija,))
    else:
        cursor.execute("SELECT * FROM questions ORDER BY RAND() LIMIT 10")
        
    questions = cursor.fetchall()
    
    # Pamti ID-eve ovih 10 pitanja
    session['current_quiz_questions'] = [q['id'] for q in questions]
    
    cursor.close()
    db.close()
    
    return render_template('quiz.html', questions=questions, category_name=kategorija)

# --- REZULTAT (OBRADA ODGOVORA) ---
@app.route('/result', methods=['POST'])
def result():
    if 'user_id' not in session: return redirect(url_for('login'))
    
    kategorija = request.form.get('category_used')
    question_ids = session.get('current_quiz_questions', [])
    
    if not question_ids:
        return redirect(url_for('index'))

    db = connect_db()
    cursor = db.cursor(dictionary=True)
    
    format_strings = ','.join(['%s'] * len(question_ids))
    cursor.execute(f"SELECT id, correct_answer FROM questions WHERE id IN ({format_strings})", tuple(question_ids))
    
    questions_to_score = cursor.fetchall()
    
    score = 0
    total = len(questions_to_score) 
    
    for q in questions_to_score:
        user_answer = request.form.get(f"q{q['id']}")
        if user_answer == q['correct_answer']:
            score += 1 
    
    percent = (score / total * 100) if total > 0 else 0
    
    if percent >= 80:
        message, rank = "Genije! Svaka čast! 🏆", "Gold"
    elif percent >= 50:
        message, rank = "Nije loše, na dobrom si putu! 👍", "Silver"
    else:
        message, rank = "Moraš još malo da vežbaš... 📚", "Bronze"

    cursor.execute("INSERT INTO results (user_id, score, date) VALUES (%s, %s, %s)", 
                   (session['user_id'], score, datetime.datetime.now()))
    db.commit()
    cursor.close()
    db.close()

    return render_template('result.html', score=score, total=total, message=message, rank=rank, percent=percent, category=kategorija)

# --- ADMIN PANEL (UPRAVLJANJE PITANJIMA) ---
@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if 'username' not in session or session['username'] != 'admin':
        return "Pristup odbijen!", 403 
    
    db = connect_db()
    cursor = db.cursor(dictionary=True)

    if request.method == 'POST': 
        cursor.execute("""
        INSERT INTO questions (question, category, answer_a, answer_b, answer_c, answer_d, correct_answer) 
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (request.form['question'], request.form['category'], request.form['answer_a'], 
              request.form['answer_b'], request.form['answer_c'], request.form['answer_d'], 
              request.form['correct_answer']))
        db.commit()
        return redirect(url_for('admin')) 
        
    cursor.execute("SELECT * FROM questions ORDER BY id DESC")
    all_questions = cursor.fetchall()
    cursor.close()
    db.close()
    return render_template('admin.html', questions=all_questions)

# --- BRISANJE PITANJA ---
@app.route('/delete_question/<int:id>')
def delete_question(id):
    if 'username' not in session or session['username'] != 'admin':
        return "Pristup odbijen!", 403
    
    db = connect_db()
    cursor = db.cursor()
    cursor.execute("DELETE FROM questions WHERE id = %s", (id,))
    db.commit()
    cursor.close()
    db.close()
    return redirect(url_for('admin'))

# --- RANG LISTA ---
@app.route('/leaderboard')
def leaderboard():
    db = connect_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT users.username, results.score, results.date 
        FROM results 
        JOIN users ON results.user_id = users.id 
        ORDER BY results.score DESC 
        LIMIT 10
    """)
    players = cursor.fetchall()
    cursor.close()
    db.close()
    return render_template('leaderboard.html', players=players)

if __name__ == '__main__':
    app.run(debug=True)