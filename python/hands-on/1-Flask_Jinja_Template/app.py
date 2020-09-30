from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def abc():
    return render_template("index.html",number1=101,number2=202,number3=303)

@app.route("/second")
def second():
    return render_template("second.html",number1=10001,number2=20002,number3=30003)




if __name__=='__main__':
   app.run(host='0.0.0.0', port=80)