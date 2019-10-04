from flask import Flask,request, render_template, flash, redirect, url_for,session, logging
from flask_mysqldb import MySQL 
from wtforms import Form, StringField, TextAreaField, PasswordField, validators, DateTimeField, BooleanField, IntegerField
from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired, FileAllowed
from passlib.hash import sha256_crypt
from functools import wraps
from werkzeug.utils import secure_filename
from docx import Document
from coolname import generate_slug
from datetime import timedelta
from flask_mail import Mail, Message
from threading import Thread
from flask import render_template_string
from itsdangerous import URLSafeTimedSerializer
from validate_email import validate_email
import random
import json

app = Flask(__name__)
app.secret_key= 'huihui'

#Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'nubaf'
app.config['MYSQL_PASSWORD'] = 'nubafgg'
app.config['MYSQL_DB'] = 'flask'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'


app.config.update(
	DEBUG=True,
	MAIL_SERVER='smtp.gmail.com',
	MAIL_PORT=465,
	MAIL_USE_SSL=True,
	MAIL_USERNAME = 'nickqwerty76@gmail.com',
	MAIL_PASSWORD = 'Zeitgeist77'
	)
mail = Mail(app)


######################################################################

#  pip install validate_email py3DNS itsdangerous


def asynch(f):
	@wraps(f)
	def wrapper(*args, **kwargs):
		thr = Thread(target=f, args=args, kwargs=kwargs)
		thr.start()
	return wrapper

@asynch
def send_async_email(app, msg):
	with app.app_context():
		mail.send(msg)


htmlbody='''
Your account on <b>The Best</b> Quiz App was successfully created.
Please click the link below to confirm your email address and
activate your account:
  
<a href="{{ confirm_url }}">{{ confirm_url }}</a>
 
--
Questions? Comments? Email nickqwerty76@gmail.com.
'''

@app.route('/sendmail', methods = ['GET','POST'])
def send_email(recipients,html_body):
	try:
		msg = Message('Confirm Your Email Address',
		  sender="nickqwerty76@gmail.com",
		  recipients=recipients)
		# msg.body = "Yo!\nHave you heard the good word of Python???"
		msg.html = html_body
		send_async_email(app, msg)
		# return 'Mail sent!'
		return
	except Exception as e:
		# return(str(e))
		return


def send_confirmation_email(user_email):
	confirm_serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
 
	confirm_url = url_for('confirm_email',
		token=confirm_serializer.dumps(user_email, salt='email-confirmation-salt'),
		_external=True)
 
	html = render_template_string(htmlbody, confirm_url=confirm_url)

	send_email([user_email], html)





##########################################################################3


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

		# check if email is valid, verify

		# is_valid = validate_email(email,verify=True)
		# if is_valid == False:
		# 	flash('Wrong email','danger')
		# do something

		username = form.username.data
		password = sha256_crypt.encrypt(str(form.password.data))
		cur = mysql.connection.cursor()
		cur.execute('INSERT INTO users(username,name,email, password,confirmed) values(%s,%s,%s,%s,0)', (username,name, email, password))
		mysql.connection.commit()
		cur.close()
		send_confirmation_email(email)
		flash('Thanks for registering!  Please check your email to confirm your email address.', 'success')
		return redirect(url_for('index')) 
		# change in login function to redirect to warning page

	return render_template('register.html', form=form)


######################################################################

	# except IntegrityError:
	#     db.session.rollback()
	#     flash('ERROR! Email ({}) already exists.'.format(form.email.data), 'error')





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


# Zeitgeist77 password nickqwerty76

######################################################################3


@app.route('/confirm/<token>')
def confirm_email(token):
	try:
		confirm_serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
		email = confirm_serializer.loads(token, salt='email-confirmation-salt', max_age=3600)
	except:
		flash('The confirmation link is invalid or has expired.', 'error')
		return redirect(url_for('login'))
 

	cur = mysql.connection.cursor()
	results = cur.execute('SELECT * from users where email = %s' , [email])
	if results > 0:
		data = cur.fetchone()
		email_confirmed = data['confirmed']


	if email_confirmed:
		flash('Account already confirmed. Please login.', 'info')
	else:

		results = cur.execute('UPDATE users SET confirmed = 1 where email = %s' , [email])
		mysql.connection.commit()
		cur.close()

		flash('Thank you for confirming your email address!')
 
	return redirect(url_for('index'))



if __name__ == "__main__":
	app.run(debug=True)
