from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World"

@app.route("/a")
def a():
    return "a"


@app.route("/b/<string:id>")
def b(id):
    return f'b:...... {id}'


if __name__=='__main__':
   app.run(host='0.0.0.0', port=80)