# Quiz App Flask

A quiz app where user can create as well as give tests based on Flask micro framework.

## Features
1. Unique ID to each test
2. Test creator can choose to display marks to students or not
3. Minimal UI
4. Email validation and verification
5. Set test timing

## Screenshots

![Index](https://github.com/vivekkairi/quiz-app-flask/blob/master/static/index.png)

![Dashboard](https://github.com/vivekkairi/quiz-app-flask/blob/master/static/dashboard.png)

## Installation

```bash
pip install -r requirements.txt
```

## Usage

Open app.py and setup config
```python
app.config.update(
	DEBUG=True,
	MAIL_SERVER='smtp.gmail.com',
	MAIL_PORT=465,
	MAIL_USE_SSL=True,
	MAIL_USERNAME = 'vivekkairi30oct@gmail.com',
	MAIL_PASSWORD = 'temp@123'
	)

app.config['MYSQL_USER'] = 'username'
app.config['MYSQL_PASSWORD'] = 'password'
```

Load database
```bash
mysql -u username -p flask < data.sql
```

Run the program using 
```bash
python3 app.py or flask run
```

## License
[MIT](https://choosealicense.com/licenses/mit/)


