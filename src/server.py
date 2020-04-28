import os
from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def index():
    today = datetime.now()
    return "Hi. This is a new new deploy. {}".format(today.strftime("%Y-%m-%d %H:%M:%S"))

if __name__ == "__main__":
    SERVER_PORT = os.environ.get("SERVER_PORT", "8000")
    app.run(host="", port=int(SERVER_PORT))
