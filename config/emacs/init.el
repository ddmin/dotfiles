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

(setq x-select-enable-clipboard t)
(setq evil-want-C-u-scroll t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; install packages
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

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

;; theme
(load-theme 'dracula t)
(global-hl-line-mode t)

(powerline-evil-vim-theme)
(powerline-evil-vim-color-theme)
