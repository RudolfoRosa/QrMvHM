#!/usr/bin/env python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def root():
    return "My Faro first app.<br>Congrats"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
