.PHONY: build serve push clean

build: clean
	docker run -p 4001:4000 --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/jekyll:latest jekyll b

serve: clean
	docker run -p 4001:4000 --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/jekyll:latest jekyll s

push: clean build
	rsync -uav _site/* jorijn@dominus.jorijn.com:~/public_html/ --delete

clean:
	$(RM) -r _site/