# app.py
from flask import Flask, render_template, request

app = Flask(__name__, static_folder='static')
tasks = {}


@app.route('/')
def index():
    return render_template('index.html', tasks=tasks)


@app.route('/add', methods=['POST'])
def add_task():
    task_name = request.form['task']
    if task_name not in tasks:
        tasks[task_name] = False
    else:
        print(f"Task '{task_name}' already exists!")
    return render_template('index.html', tasks=tasks)


@app.route('/remove', methods=['POST'])
def remove_task():
    task_name_to_remove = request.form['task']
    if task_name_to_remove in tasks:
        del tasks[task_name_to_remove]
    else:
        print(f"Task '{task_name_to_remove}' not found!")
    return render_template('index.html', tasks=tasks)


if __name__ == '__main__':
    app.run(debug=True)
