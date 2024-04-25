;; ewhd emacs configuration -*- lexical-binding: t; -*-

;; The purpose of this file is to load and configure denote.el

(use-package denote
  :ensure t
  :init
  (require 'denote-org-extras)
  (denote-rename-buffer-mode 1)
  :custom
  (denote-prompts '(title keywords subdirectory))
  (denote-directory (expand-file-name "~/Documents/notes/"))
  (denote-file-type 'org)
  :bind (("C-c d d" . denote)
	 ("C-c d l" . denote-link)
	 ("C-c d f" . list-denotes)
	 ("C-c d d" . denote)
	 ("C-c d d" . denote)
	 )
  :config
  :hook ((dired-mode . denote-dired-mode))
  )

(use-package denote-explore
  :ensure t
  :custom
  ;; Location of graph files
  (denote-explore-network-directory "~/Documents/notes/graphs/")
  (denote-explore-network-filename "denote-network")
  ;; Output format
  (denote-explore-network-format 'graphviz)
  (denote-explore-network-graphviz-filetype "svg")
  ;; Exlude keywords or regex
  (denote-explore-network-keywords-ignore '("bib"))
  )

(use-package denote-menu
  :ensure t)


(use-package consult-notes
  :ensure t
  :commands (consult-notes
             consult-notes-search-in-all-notes
             ;; if using org-roam 
             ;; consult-notes-org-roam-find-node
             ;; consult-notes-org-roam-find-node-relation
	     )
  :config
  (setq consult-notes-file-dir-sources '(("Documents"  ?d  "~/Documents/CF/")
					 ;; ("Local" ?l "./")
					 )) ;; Set notes dir(s), see below
  ;; Set org-roam integration, denote integration, or org-heading integration e.g.:
  ;; (setq consult-notes-org-headings-files '("~/path/to/file1.org"
                                           ;; "~/path/to/file2.org"))
  ;; (consult-notes-org-headings-mode)
  (when (locate-library "denote")
    (consult-notes-denote-mode))
  ;; search only for text files in denote dir
  ;; (setq consult-notes-denote-files-function (function denote-directory-text-only-files))
  )
