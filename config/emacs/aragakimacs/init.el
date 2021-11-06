;; initialize packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; defaults
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t)
(setq x-select-enable-clipboard t)
(setq evil-want-C-u-scroll t)

(setq make-backup-file nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; shell
(defvar default-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list default-shell)))
(ad-activate 'ansi-term)

;; line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; install packages
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package org
  :ensure t)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree))

(use-package dracula-theme
  :ensure t)

(use-package powerline-evil
  :ensure t)

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package all-the-icons
  :ensure t)

;; dashboard
(use-package dashboard
  :ensure t
  :defer nil
  :preface
  (defun create-scratch-buffer ()
    "Create a scratch buffer"
    (interactive)
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (lisp-interaction-mode))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)))
  (setq dashboard-banner-logo-title "Welcome to Aragakimacs!")
  (setq dashboard-startup-banner "~/.emacs.d/img/aragakimacs-logo.png")
  (setq dashboard-center-content t)
  (setq dashboard-footer-icon "")
  (setq dashboard-set-navigator t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-navigator-buttons
        `(;; line1
          ((,nil
            "Open scratch buffer"
            "Switch to the scratch buffer"
            (lambda (&rest _) (create-scratch-buffer))
            'default)
           (nil
            "Open config.org"
            "Open aragakimacs config file for easy editing"
            (lambda (&rest _) (find-file "~/.emacs.d/config.org"))
            'default)))))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; theme
(load-theme 'dracula t)
(global-hl-line-mode t)

(powerline-evil-vim-theme)
(powerline-evil-vim-color-theme)

;; keybinds
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
