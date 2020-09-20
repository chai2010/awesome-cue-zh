#
# present:
#
# go get golang.org/x/tools/cmd/present
#
# https://pkg.go.dev/golang.org/x/tools/cmd/present
# https://pkg.go.dev/golang.org/x/tools/present
#

run:
	present -base=./present -play

html:
	-rm -rf ./_talk_html_

	# present
	mkdir -p _talk_html_/static
	curl -s http://127.0.0.1:3999/static/notes.js > _talk_html_/static/notes.js
	curl -s http://127.0.0.1:3999/static/slides.js | sed -E 's/(\/static\/)/.\1/' > _talk_html_/static/slides.js
	curl -s http://127.0.0.1:3999/static/styles.css > _talk_html_/static/styles.css
	curl -s http://127.0.0.1:3999/static/notes.css > _talk_html_/static/notes.css

	# cue-intro.slide
	cp cue-intro.slide _talk_html_/
	mkdir -p _talk_html_/images
	mkdir -p _talk_html_/code
	cp -R images/ _talk_html_/images/
	cp -R code/ _talk_html_/code/
	curl -s http://127.0.0.1:3999/cue-intro.slide | sed -E 's/(\/static\/)/.\1/' | sed -E '/play\.js/d' > _talk_html_/index.html

clean:
	-rm -rf ./_talk_html_
