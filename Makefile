.PHONY: build serve clean

build: clean
	docker run --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/jekyll:latest jekyll b

serve: clean
	docker run -p 4001:4001 --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/jekyll:latest jekyll s -P4001

clean:
	$(RM) -r _site/
