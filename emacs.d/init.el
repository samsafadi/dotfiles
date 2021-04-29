;; no bell (bells are for clock towers)
(setq-default ring-bell-function 'ignore)
(setq-default inhibit-startup-message t) ; clean starting interface
(if (fboundp 'tool-bar-mode)   (tool-bar-mode   -1)) ; No toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; No scrollbar

;; appearance (make it sexy)
(set-face-attribute 'default nil :font "Menlo" :height 130)
(setq-default display-line-numbers 'relative)
(setq-default line-spacing 0.2)

;; escape homie
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; spaces over tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; ssh
(setq-default tramp-default-method "ssh")

;; open files in dired mode using 'open'
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "z")
       (lambda () (interactive)
         (let ((fn (dired-get-file-for-visit)))
           (start-process "default-app" nil "open" fn))))))

;; ----------------------------------------------------------------------------
;; packages
;; ----------------------------------------------------------------------------

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)

;; Where to install packages

;; deal with paths
(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

;; Theme
(use-package doom-themes
  :init
  (setq doom-gruvbox-dark-variant "hard")
  (load-theme 'doom-gruvbox t))

;; Org mode
(use-package org
  :init
  (define-key global-map "\C-ca" 'org-agenda)
  :hook (org-mode . (lambda () (setq line-spacing 0.25)))
  :config
  (setq org-agenda-files '("~/Documents/Org/Tasks.org")
    org-pretty-entities t
    org-hide-emphasis-markers t
    ;; show actually italicized text instead of /italicized text/
    org-agenda-block-separator ""
    org-fontify-whole-heading-line t
    org-fontify-done-headline t
    org-fontify-quote-and-verse-blocks t))

(use-package org-bullets
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Icons
(use-package all-the-icons)

;; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Evil
(use-package evil
  :ensure t
  :init
  (setq-default evil-want-C-u-scroll t) ; deal with ctrl-u
  (setq-default evil-shift-width 2)
  (setq-default evil-indent-convert-tabs 1)
  (setq-default evil-want-keybinding nil)
  :config
  (define-key evil-normal-state-map (kbd "B") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "E") 'evil-last-non-blank)
  (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
  (add-hook 'occur-mode-hook
          (lambda ()
            (evil-add-hjkl-bindings occur-mode-map 'emacs
              (kbd "/")       'evil-search-forward
              (kbd "n")       'evil-search-next
              (kbd "N")       'evil-search-previous
              (kbd "C-d")     'evil-scroll-down
              (kbd "C-u")     'evil-scroll-up
              (kbd "C-w C-w") 'other-window)))

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
    "e" 'find-file
    "<SPC>" 'switch-to-buffer
    "k" 'kill-buffer
    "b" 'bookmark-jump
    "a" 'org-agenda
    "p" 'projectile-command-map
    "g" 'magit))

  (use-package evil-surround
    :ensure t
    :init
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)

  (use-package evil-collection
    :after evil
    :ensure t
    :init
    (evil-collection-init))

  ;; After everything (because evil-leader)
  (evil-mode 1))

(use-package evil-org
  :ensure t
  :after (org evil)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (add-hook 'org-mode-hook 'evil-org-mode)
	(add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map
                (kbd "TAB") (kbd "<tab>")))))

;; Which key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; Ivy
(use-package swiper
  :ensure t)

(use-package counsel
  :ensure t)

(use-package ivy
  :diminish
  :bind
    (("C-s" . swiper)
      :map ivy-minibuffer-map
      ("TAB" . ivy-alt-done)
      ("C-f" . ivy-alt-done)
      ("C-l" . ivy-alt-done)
      ("C-j" . ivy-next-line)
      ("C-k" . ivy-previous-line)
      :map ivy-switch-buffer-map
      ("C-k" . ivy-previous-line)
      ("C-l" . ivy-done)
      ("C-d" . ivy-switch-buffer-kill)
      :map ivy-reverse-i-search-map
      ("C-k" . ivy-previous-line)
      ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

;; Company
(use-package company
  :init
  (company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)
  (add-hook 'eshell-mode-hook (lambda () (company-mode -1)))
  :config
  (company-tng-configure-default)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)

  :hook
  (add-hook 'after-init-hook 'global-company-mode))

;; lsp
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ;; if you want which-key integration
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

;; python
(use-package python-mode
  :ensure t
  :hook (python-mode . lsp)
  :custom
  (python-shell-interpreter "python3"))

;; javascript
(use-package js
  :init
  :hook (js-mode . lsp)
  :config
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (setq js-indent-level 2))

(use-package js2-mode
  :ensure t
  :init
  (setq-default js2-basic-offset 2
                js2-auto-indent-p t))

;; formatting
(use-package python-black
  :demand t
  :after python)

;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind
  (:map projectile-mode-map
    ("s-p" . projectile-command-map)
    ("C-c p" . projectile-command-map)))

(use-package magit
  :bind (("C-x g" . magit)))

;; auctex
(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)

  (setq TeX-command-force "LaTeX") 
  (setq TeX-clean-confirm t)
  (setq
    ;; Set the list of viewers for Mac OS X.
    TeX-view-program-list
    '(("Preview.app" "open -a Preview.app %o")
      ("Skim" "open -a Skim.app %o")
      ("displayline" "displayline %n %o %b")
      ("open" "open %o"))
    ;; Select the viewers for each file type.
    TeX-view-program-selection
    '((output-dvi "open")
      (output-pdf "Skim")
      (output-html "open"))))

;; pdf-tools
(use-package pdf-tools
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "16ab866312f1bd47d1304b303145f339eac46bbc8d655c9bfa423b957aa23cc9" default))
 '(package-selected-packages
   '(evil-collection magit pdf-tools preview-latex auctex js-mode js2-mode projectile counsel-spotify org-bullets evil-org doom-modeline all-the-icons python-black badwolf-theme exec-path-from-shell which-key use-package python-mode moe-theme lsp-ivy kaolin-themes fzf evil doom-themes counsel company-anaconda)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
