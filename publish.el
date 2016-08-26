(require 'ox-publish)

(setq org-publish-project-alist
      `(("website-html"
	 :base-directory ,(concat default-directory "src/")
	 :base-extension "org"
	 :exclude "software"
	 :publishing-directory ,(concat default-directory "doc/")
	 :publishing-function org-html-publish-to-html
	 :section-numbers nil
	 :recursive t)
	("website-pdf"
	 :base-directory ,(concat default-directory "src/articles/")
	 :base-extension "org"
	 :publishing-directory ,(concat default-directory "doc/articles/")
	 :publishing-function org-latex-publish-to-pdf
	 :section-numbers nil)
	("website-sw"
	 :base-directory ,(concat default-directory "src/software/")
	 :base-extension "org\\|html\\|pdf"
	 :publishing-directory ,(concat default-directory "doc/software/")
	 :publishing-function org-publish-attachment
	 :recursive t)
	("website-root"
	 :base-directory ,(concat default-directory "src/")
	 :base-extension "org\\|setup"
	 :publishing-directory ,(concat default-directory "doc/")
	 :publishing-function org-publish-attachment)
	("website" :components ("website-root" "website-sw"
				"website-html" "website-pdf"))))
