from flask import Flask, render_template, send_file # type: ignore
import requests
import os

app = Flask(__name__)

# Path for the PDF
pdf_url = "https://raw.githubusercontent.com/yash5800/ND_store/main/EXPNO7_2024-10-21-06:59:06_pdf"

@app.route('/')
def index():
    return render_template('view_pdf.html')  # Render the HTML file

@app.route('/view')
def view_pdf():
    # Fetch the PDF
    response = requests.get(pdf_url)
    
    if response.status_code == 200:
        # Save the PDF temporarily
        temp_pdf_path = 'temp_pdf.pdf'
        with open(temp_pdf_path, 'wb') as f:
            f.write(response.content)
        try:
            # Serve the file
            return send_file(temp_pdf_path, as_attachment=False)
        finally:
            # Remove the temporary file after sending it
            if os.path.exists(temp_pdf_path):
                os.remove(temp_pdf_path)
    else:
        return "Failed to retrieve the PDF."

if __name__ == '__main__':
    app.run(debug=True)
