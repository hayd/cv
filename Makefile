all: cv.html cv.pdf cv.docx cv.txt

cv.html: cv.md style.css
		pandoc --standalone -c style.css --from markdown --to html -o build/cv.html cv.md

cv.pdf: cv.html
		wkhtmltopdf build/cv.html build/cv.pdf

cv.docx: cv.md
		pandoc --from markdown --to docx -o build/cv.docx cv.md

cv.txt: cv.md
		pandoc --standalone --smart --from markdown --to plain -o build/cv.txt cv.md

clean:
		rm -f *.html *.pdf *.docx *.txt build/