from flask import Flask,request, render_template, flash, redirect, url_for,session, logging
from flask_mysqldb import MySQL 
from wtforms import Form, StringField, TextAreaField, PasswordField, validators, DateTimeField, BooleanField, IntegerField
from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired, FileAllowed
from passlib.hash import sha256_crypt
from functools import wraps
from werkzeug.utils import secure_filename
from docx import Document
import json
from coolname import generate_slug
from datetime import timedelta
import random

app = Flask(__name__)
app.secret_key= 'huihui'

#Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'nubaf'
app.config['MYSQL_PASSWORD'] = 'nubafgg'
app.config['MYSQL_DB'] = 'flask'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

#init Mysql
mysql = MySQL(app)

@app.before_request
def make_session_permanent():
    session.permanent = True
    app.permanent_session_lifetime = timedelta(minutes=5)


def is_logged(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			return f(*args, **kwargs)
		else:
			flash('Unauthorized, Please login','danger')
			return redirect(url_for('login'))
	return wrap


def doctodict(filepath):
    document = Document(filepath)
    data={}
    count=1
    for table in document.tables:
        temp = {}
        for rowNo,_ in enumerate(table.rows):
            temp[table.cell(rowNo, 0).text]=table.cell(rowNo, 1).text
        data[count] = temp
        count+=1
 
    return data


class RegisterForm(Form):
	name = StringField('Name', [validators.Length(min=3, max=50)])
	username = StringField('Username', [validators.Length(min=4,max=25)])
	email = StringField('Email', [validators.Length(min=6,max=50)])
	password = PasswordField('Password', [
			validators.DataRequired(),
			validators.EqualTo('confirm', message="Password do not match")
		])
	confirm = PasswordField('Confirm Password')


class UploadForm(FlaskForm):
    doc = FileField('Docx Upload', validators=[FileRequired()])
    start_date_time = DateTimeField('Start Date & Time')
    end_date_time = DateTimeField('End Date & Time')
    show_result = BooleanField('Show Result after completion')
    duration = IntegerField('Duration')
    password = StringField('Test Password', [validators.Length(min=3, max=6)])


class TestForm(Form):
	test_id = StringField('Test ID')
	password = PasswordField('Test Password')


@app.route('/')
def index():
	return render_template('layout.html')


@app.route('/register', methods=['GET','POST'])
def register():
	form = RegisterForm(request.form)
	if request.method == 'POST' and form.validate():
		name = form.name.data 
		email = form.email.data
		username = form.username.data
		password = sha256_crypt.encrypt(str(form.password.data))
		cur = mysql.connection.cursor()
		cur.execute('INSERT INTO users(username,name,email, password) values(%s,%s,%s,%s)', (username,name, email, password))
		mysql.connection.commit()
		cur.close()
		flash('You are now registered.', 'success')
		redirect(url_for('index'))
	return render_template('register.html', form=form)


@app.route('/login', methods=['GET','POST'])
def login():
	if request.method == 'POST':
		username = request.form['username']
		password_candidate = request.form['password']
		cur = mysql.connection.cursor()
		results = cur.execute('SELECT * from users where username = %s' , [username])
		if results > 0:
			data = cur.fetchone()
			password = data['password']
			if sha256_crypt.verify(password_candidate, password):
				session['logged_in'] = True
				session['username'] = username
				return redirect(url_for('dashboard'))
			else:
				error = 'Invalid password'
				return render_template('login.html', error=error)
			cur.close()
		else:
			error = 'Username not found'
			return render_template('login.html', error=error)
	return render_template('login.html')


@app.route('/dashboard')
@is_logged
def dashboard():
	return render_template('dashboard.html')


@app.route('/logout')
def logout():
	session.clear()
	flash('Successfully logged out', 'success')
	return redirect(url_for('index'))


@app.route('/create-test', methods = ['GET', 'POST'])
@is_logged
def create_test():
	form = UploadForm()
	if request.method == 'POST' and form.validate_on_submit():
		f = form.doc.data
		filename = secure_filename(f.filename)
		f.save('questions/' + filename)
		cur = mysql.connection.cursor()
		d = doctodict('questions/' + f.filename.replace(' ', '_').replace('(','').replace(')',''))
		test_id = generate_slug(2)
		for no, data in d.items():
			marks = data['((MARKS)) (1/2/3...)']
			a = data['((OPTION_A))']
			b = data['((OPTION_B))']
			c = data['((OPTION_C))']
			d = data['((OPTION_D))']
			question = data['((QUESTION))']
			correct_ans = data['((CORRECT_CHOICE)) (A/B/C/D)']
			explanation = data['((EXPLANATION)) (OPTIONAL)']
			cur.execute('INSERT INTO questions(test_id,qid,q,a,b,c,d,ans,marks) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)', 
				(test_id,no,question,a,b,c,d,correct_ans,marks))
			mysql.connection.commit()
		start_date_time = form.start_date_time.data
		end_date_time = form.end_date_time.data
		show_result = form.show_result.data
		duration = form.duration.data
		password = form.password.data
		cur.execute('INSERT INTO teachers (username, test_id, start, end, duration, show_ans, password) values(%s,%s,%s,%s,%s,%s,%s)',
			(dict(session)['username'], test_id, start_date_time, end_date_time, duration, show_result, password))
		mysql.connection.commit()
		cur.close()
	return render_template('create_test.html' , form = form)


@app.route('/give-test/<testid>', methods=['GET','POST'])
@is_logged
def test(testid):
	if request.method == 'GET':
		data = {'marks': '', 'q': '', 'a': "", 'b':"",'c':"",'d':""}
		return render_template('quiz.html' ,**data)
	else:
		num = request.form['no']
		cur = mysql.connection.cursor()
		results = cur.execute('SELECT * from questions where test_id = %s and qid =%s',(testid, num))
		if results > 0:
			data = cur.fetchone()
			del data['ans']
			return json.dumps(data)
		#Recieve post data of qid and username
		#Fetch question from database
		#JSONify that data and return
		#Rest let the frontend JS handle


@app.route("/give-test", methods = ['GET', 'POST'])
@is_logged
def give_test():
	form = TestForm(request.form)
	if request.method == 'POST' and form.validate():
		test_id = form.test_id.data
		password_candidate = form.password.data
		cur = mysql.connection.cursor()
		results = cur.execute('SELECT * from teachers where test_id = %s', [test_id])
		if results > 0:
			data = cur.fetchone()
			password = data['password']
			if password == password_candidate:
				return redirect(url_for('test' , testid = test_id))
		cur.close()
	return render_template('give_test.html', form = form)


@app.route('/randomize', methods = ['POST'])
def random_gen():
	if request.method == "POST":
		id = request.form['id']
		print(id)
		cur = mysql.connection.cursor()
		results = cur.execute('SELECT count(*) from questions where test_id = %s', [id.split('-',1)[-1]])
		if results > 0:
			data = cur.fetchone()
			total = data['count(*)']
			nos = list(range(1,int(total)+1))
			random.Random(id).shuffle(nos)
			cur.close()
			return json.dumps(nos)


if __name__ == "__main__":
	app.run(debug=True)
