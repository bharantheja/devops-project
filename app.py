from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello! DevOps Project by B. Sai Bharan Theja (CTIS5524) is running!"

@app.route("/health")
def health():
    return "Status: OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

