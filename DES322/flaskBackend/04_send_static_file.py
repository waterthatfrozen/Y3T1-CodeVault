from flask import Flask
from flask import render_template
import os

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/index")
def index():
    return app.send_static_file("frontend/index.html")

@app.route("/hello/<name>")
def hello(name):
    return render_template("hello.html", name=name)



if __name__ == "__main__":
    """
    The default port is 5000, to change port of your service in powershell use following command:
    $env:PORT = xxxx
    """
    app.run(host="0.0.0.0",port=int(os.environ.get('PORT',5000)))