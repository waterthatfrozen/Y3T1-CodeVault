from flask import Flask
import os
app = Flask(__name__)
@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/hi")
def say_hi():
    return "<p>Hi, there!</p>"

@app.route("/hello/<name>")
def hello(name):
    return f"<p>Hello, {name}!</p>"

if __name__ == "__main__":
    """
    The default port is 5000, to change port of your service in powershell use following command:
    $env:PORT = xxxx
    """
    app.run(host="0.0.0.0",port=int(os.environ.get('PORT',5000)))