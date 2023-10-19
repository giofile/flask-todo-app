from flask import Flask, request, render_template, redirect, url_for, flash, g
import secrets

app = Flask(__name__)
app.secret_key = secrets.token_hex(16)
tasks = {}


def get_tasks():
    if 'tasks' not in g:
        g.tasks = {}
    return g.tasks


@app.route('/')
def index():
    return render_template('index.html', tasks=tasks)


@app.route('/add', methods=['POST'])
def add_task():
    task_name = request.form['task']
    if task_name not in tasks:
        tasks[task_name] = None
    return render_template('index.html', tasks=tasks)


@app.route('/remove', methods=['POST'])
def remove_task():
    task_name_to_remove = request.form['task']
    if task_name_to_remove in tasks:
        del tasks[task_name_to_remove]
    return render_template('index.html', tasks=tasks)

# # This block is necessary when you run the app directly (not during testing)
# if __name__ == '__main__':
#     app.run(debug=True)
