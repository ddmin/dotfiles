(setq user-emacs-directory "/home/anon/.emacs.d")

;; ui
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; startup
(setq make-backup-files nil)

;; copy / paste
(setq x-select-enable-clipboard t)

;; line numbering
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  (setf use-package-always-ensure t))

(setq evil-want-C-u-scroll t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree))

(use-package powerline-evil
  :ensure t)

(powerline-evil-vim-theme)
(powerline-evil-vim-color-theme)

(use-package dracula-theme
  :ensure t)

(load-theme 'dracula t)
(global-hl-line-mode t)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package org
  :ensure t)

(use-package magit
  :ensure t)

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1))

(use-package emojify
  :hook (after-init . global-emojify-mode))

(defalias 'yes-or-no-p 'y-or-n-p)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" default))
 '(package-selected-packages
   '(all-the-icons vterm use-package undo-tree undo-fu ranger key-chord evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "ADBO" :slant normal :weight semi-bold :height 143 :width normal)))))

