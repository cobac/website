.PHONY: fetch build

build:
	rm -r public/*.html || true
	emacs -Q --script lisp/build.el
	mkdir -p public/media
	cp -r media/* public/media/
	perl -pi -e 's|\.\./media/|./media/|g' public/*.html

fetch:
	curl -o lisp/org-static-blog.el https://raw.githubusercontent.com/bastibe/org-static-blog/refs/heads/master/org-static-blog.el
	curl -o lisp/htmlize.el https://raw.githubusercontent.com/emacsorphanage/htmlize/refs/heads/master/htmlize.el
	curl -o lisp/dash.el https://raw.githubusercontent.com/magnars/dash.el/refs/heads/master/dash.el
