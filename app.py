from flask import Flask, render_template, send_file, request
import requests
import os
import time

app = Flask(__name__)

# Path for the PDF
pdf_url = "https://raw.githubusercontent.com/yash5800/ND_store/main/EXPNO7_2024-10-21-06:59:06_pdf"

@app.route('/')
def index():
    return render_template('index.html')  # Render the main HTML file

@app.route('/view', methods=['POST'])
def view_pdf():
    # Fetch the PDF
    response = requests.get(pdf_url)

    if response.status_code == 200:
        # Save the PDF temporarily
        temp_pdf_path = 'temp_pdf.pdf'
        with open(temp_pdf_path, 'wb') as f:
            f.write(response.content)

        return render_template('view_pdf.html', pdf_path=temp_pdf_path)


    else:

        return "Failed to retrieve the PDF."

@app.route('/display/<path:pdf_path>')
def display_pdf(pdf_path):
    return send_file(pdf_path, as_attachment=False)

if __name__ == '__main__':
    app.run(debug=True)
