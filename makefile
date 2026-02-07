.PHONY: fetch build

build:
	emacs -Q --script lisp/build.el

fetch:
	curl -o org-static-blog.el https://raw.githubusercontent.com/bastibe/org-static-blog/refs/heads/master/org-static-blog.el
