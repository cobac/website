.PHONY: fetch build strip-metadata

build: strip-metadata
	rm -r public/*.html || true
	rm -r public/media || true
	mkdir -p public/media
	emacs -Q --script lisp/build.el
	cp -r media/* public/media/
	perl -pi -e 's|\.\./media/|./media/|g' public/*.html

strip-metadata:
	exiftool -all= -overwrite_original media/*.jpeg media/*.jpg media/*.png 2>/dev/null || true
	exiftool -all= -overwrite_original public/media/*.jpeg public/media/*.jpg public/media/*.png 2>/dev/null || true

fetch:
	curl -o lisp/org-static-blog.el https://raw.githubusercontent.com/bastibe/org-static-blog/refs/heads/master/org-static-blog.el
	curl -o lisp/htmlize.el https://raw.githubusercontent.com/emacsorphanage/htmlize/refs/heads/master/htmlize.el
	curl -o lisp/dash.el https://raw.githubusercontent.com/magnars/dash.el/refs/heads/master/dash.el
