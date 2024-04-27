;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "SauceCodePro Nerd Font" :size 18 :weight 'regular)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font" :size 24 :weight 'regular))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; remove highlighting (like :set noh)
(map! :leader
      :desc "Clear search highlighting"
      "SPC"
      #'evil-ex-nohighlight
      (:prefix ("f")))

;; word wrapping
(+global-word-wrap-mode +1)

;; disable comments on new lines
(setq +evil-want-o/O-to-continue-comments nil)

;; org-todo
(after! org
  (setq org-todo-keywords               ; This overwrites the default Doom org-todo-keywords
        '((sequence
           "TODO(t)"               ; TODO
           "WAIT(w)"               ; Waiting
           "EXAM(c)"               ; Test
           "IRL(i)"                ; IRL
           "READ(r)"               ; Reading
           "PRIORITY(p)"           ; Priority
           "|"                     ; The pipe necessary to separate "active" states and "inactive" states
           "DONE(d)"               ; Task has been completed
           "CANCELLED(c)" ))))     ; Task has been cancelled

(setq hl-todo-keyword-faces
      '(("TODO"      . "#b4d273")
        ("WAIT"      . "#e87d3e")
        ("EXAM"      . "#9e86c8")
        ("IRL"      . "#66d9ef")
        ("READ"      . "#e5b567")
        ("PRIORITY"  . "#f92672")))

;; go to todo list
(map! :leader
      :desc "Go to todo list"
      "o a f"
      (lambda() (interactive)(find-file "~/School/todo.org")))

;; open pdfs in zathura
;; https://www.txmao.vip/2024/02/4b0c64e6-d3df-4046-9efc-7412dcde8d9a/
(after! org
  (add-to-list 'org-file-apps
               '("\\.pdf\\'" . (lambda (file link)
                                 (call-process "zathura" nil 0 nil "--config-dir" "$HOME/.config/zathura" "--mode" "fullscreen" file)))))

(setq bibtex-completion-pdf-open-function (lambda (file)
                                            (call-process "zathura" nil 0 nil "--config-dir" "$HOME/.config/zathura" "--mode" "fullscreen" file)))

;; dired
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "j" #'dired
       :desc "Open dired in current directory" "d" #'dired-jump
       )
      (:after dired
              (:map dired-mode-map
               :desc "Peep-dired image previews" "d p" #'peep-dired
               :desc "Dired view file"           "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ) ; use dired-find-file instead of dired-open.

;; org-roam
(setq org-roam-directory (file-truename "~/.org/org-roam"))

;; flyspell
(setq ispell-dictionary "en")

;; change default window behavior
(map! :leader
      (:prefix ("w")
       :desc "Evil Vertical Split Window and Follow" "v" #'+evil/window-vsplit-and-follow
       :desc "Evil Vertical Split Window" "V" #'evil-window-vsplit
       :desc "Evil Split Window and Follow" "s" #'+evil/window-split-and-follow
       :desc "Evil Split Window" "S" #'evil-window-split
       )
      )

;; turn on headers from doom-docs
(add-hook! 'org-mode-hook 'doom-docs-mode)
