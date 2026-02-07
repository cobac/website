.PHONY: fetch build

build:
	rm -r public/*.html || true
	emacs -Q --script lisp/build.el

fetch:
	curl -o lisp/org-static-blog.el https://raw.githubusercontent.com/bastibe/org-static-blog/refs/heads/master/org-static-blog.el
