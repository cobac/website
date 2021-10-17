;; Load straight.el
(setq straight-recipes-gnu-elpa-use-mirror t)

(defvar bootstrap-version)
(let ((bootstrap-file
			 (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
			(bootstrap-version 5))
	(unless (file-exists-p bootstrap-file)
		(with-current-buffer
				(url-retrieve-synchronously
				 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
				 'silent 'ihibit-cookies)
			(goto-char (point-max))
			(eval-print-last-sexp)))
	(load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Helper functions
(defun coba-file-content-as-string (filename)
	"Return the contents of FILENAME as string.
From https://gist.github.com/bigodel/56a4627afdfe9ad28f6dcc68b89a97f8"
	(with-temp-buffer
		(insert-file-contents filename)
		(buffer-string)))

;; htmlize

(use-package htmlize
	:straight t
	)

;; Blog config
(use-package org-static-blog
	:straight t
	:config
	(defvar coba-website-folder "./")
	(setq org-static-blog-publish-title "Coba's website"
				org-static-blog-publish-url "https://cobac.eu/"
				org-static-blog-publish-directory (concat coba-website-folder "public/")
				org-static-blog-posts-directory (concat coba-website-folder "posts/")
				org-static-blog-drafts-directory (concat coba-website-folder "drafts/")
				org-static-blog-enable-tags t
				org-static-blog-use-preview t
				org-static-blog-preview-ellipsis "<div id=\"read more\">Read more.</div>"
				org-static-blog-index-length 1
				org-export-with-toc nil
				org-export-with-section-numbers nil
				;; This header is inserted into the <head> section of every page:
				org-static-blog-page-header (coba-file-content-as-string (concat coba-website-folder "elements/page-header.html"))
				;; This preamble is inserted at the beginning of the <body> of every page:
				org-static-blog-page-preamble (coba-file-content-as-string (concat coba-website-folder "elements/page-preamble.html"))
				;; This postamble is inserted at the end of the <body> of every page:
				org-static-blog-page-postamble (coba-file-content-as-string (concat coba-website-folder "elements/page-postamble.html"))
				;; This HTML code is inserted into the index page between the preamble and the blog posts
				org-static-blog-index-front-matter (coba-file-content-as-string (concat coba-website-folder "elements/index-front-matter.html"))
				)
	)

(org-static-blog-publish)

(message (shell-command-to-string "ls"))

(message "Site builded successfully.")
