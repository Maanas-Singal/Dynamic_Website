import random
from flask import Flask, render_template

app = Flask(__name__)

# List of positive thoughts/messages
positive_thoughts = [
    "You are capable of great things.",
    "Today is going to be a wonderful day!",
    "Believe in yourself, and you will succeed.",
    "Every day is a new beginning.",
    "You are making a difference.",
    "You are loved and appreciated.",
    "Keep going, you're doing great!",
    "Your future is bright and full of possibilities.",
]

@app.route('/')
def index():
    # Randomly select a positive thought
    positive_message = random.choice(positive_thoughts)
    return render_template('index.html', message=positive_message)

if __name__ == '__main__':
    app.run(debug=True)
