all: "AndyHaydenCV.html" "AndyHaydenCV.pdf" "AndyHaydenCV.docx" "AndyHaydenCV.txt"

"AndyHaydenCV.html": README.md style.css
		pandoc --standalone -c style.css --from markdown --to html -o "AndyHaydenCV.html" README.md

"AndyHaydenCV.pdf": "AndyHaydenCV.html"
		wkhtmltopdf "AndyHaydenCV.html" "AndyHaydenCV.pdf"

"AndyHaydenCV.docx": README.md
		pandoc --from markdown --to docx -o "AndyHaydenCV.docx" README.md

"AndyHaydenCV.txt": README.md
		pandoc --standalone --smart --from markdown --to plain -o "AndyHaydenCV.txt" README.md

clean:
		rm -f *.html *.pdf *.docx *.txt