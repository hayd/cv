all: cv.html cv.pdf cv.docx cv.txt

cv.html: README.md style.css
		pandoc --standalone -c style.css --from markdown --to html -o cv.html README.md

cv.pdf: cv.html
		wkhtmltopdf cv.html cv.pdf

cv.docx: README.md
		pandoc --from markdown --to docx -o cv.docx README.md

cv.txt: README.md
		pandoc --standalone --smart --from markdown --to plain -o cv.txt README.md

clean:
		rm -f *.html *.pdf *.docx *.txt