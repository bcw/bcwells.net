(require 'ox-publish)

(setq org-publish-use-timestamps-flag nil)

(let (my-dir default-directory)
  (setq org-publish-project-alist
	`(("all-org"
	   :base-directory ,(concat my-dir "src/")
	   :base-extension "org"
	   :exclude "blurb\\|README"
	   :publishing-directory ,(concat my-dir "doc/")
	   :publishing-function org-publish-attachment
	   :recursive t)
	  ("index-html"
	   :base-directory ,(concat my-dir "src/")
	   :publishing-directory ,(concat my-dir "doc/")
	   :publishing-function org-html-publish-to-html
	   :section-numbers nil)
	  ("articles-html"
	   :base-directory ,(concat my-dir "src/articles/")
	   :publishing-directory ,(concat my-dir "doc/articles/")
	   :publishing-function org-html-publish-to-html
	   :section-numbers nil)
	  ("articles-pdf"
	   :base-directory ,(concat my-dir "src/articles/")
	   :publishing-directory ,(concat my-dir "doc/articles/")
	   :publishing-function org-latex-publish-to-pdf
	   :section-numbers nil)
	  ("software-docs"
	   :base-directory ,(concat my-dir "src/software/")
	   :base-extension "html\\|pdf"
	   :exclude "README"
	   :publishing-directory ,(concat my-dir "doc/software/")
	   :publishing-function org-publish-attachment
	   :recursive t)
	  ("site" :components ("all-org"
			       "index-html"
			       "articles-html"
			       "articles-pdf"
			       "software-docs")))))

(org-publish "site")
