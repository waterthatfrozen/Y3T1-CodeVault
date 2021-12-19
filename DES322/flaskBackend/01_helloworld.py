from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World! 1234</p>"

if __name__ == "__main__":
    """
    The default port is 5000, to change port of your service in powershell use following command:
    $env:PORT = xxxx
    """
    app.run(host="0.0.0.0",port=int(os.environ.get('PORT',5000)))