;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; DEBUG
;(setq debug-on-error t)

(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")
			 ))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(when (file-readable-p "~/.emacs.d/local.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/local.org")))

;;; Experimental email stuff.
;(when (file-readable-p "~/.email/email.org")
;  (org-babel-load-file (expand-file-name "~/.email/email.org")))

;;; Anything below is personal preference.
;;; I recommend changing these values with the "customize" menu
;;; You can change the font to suit your liking, it won't break anything.
;;; The one currently set up is called Terminus.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(display-battery-mode nil)
 '(display-time-hook (quote (sml/propertize-time-string)) t)
 '(flycheck-display-errors-delay 0.3)
 '(flycheck-stylelintrc "~/.stylelintrc.json")
 '(initial-scratch-message "")
 '(nyan-mode t)
 '(org-agenda-custom-commands nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/document/notes/agenda.org" "~/documents/notes/todo.org" "~/documents/notes/agenda.org" "~/documents/notes/project.org")))
 '(org-journal-dir "~/documents/notes/journal")
 '(org-table-convert-region-max-lines 9999)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (org-dropbox evil-mu4e git-gutter plantuml-mode display-battery display-battery-mode smart-mode-line avy-mode format-all fortune-cookie frameshot format-sql auto-virtualenv virtualenv auctex auto-complete-auctex org-journal transpose-frame evil-matchit jedi elpy flycheck-tip flymake-python-pyflakes flycheck-pyflakes org-numbers org-number yasnippet-classic-snippets org-reveal org-tree-slide epresent org-wc org-caldav evil-numbers csv-mode bbdb-csv-import csv elfeed hs-mode origami hs hs-minor hs-minor-mode org-evil general evil-org evil-leader color-theme zenburn zenburn-theme key-chord eno ace-jump-zap ace-jump-helm-line ace-jump-buffer evil slime-company slime company-jedi zzz-to-char rainbow-delimiters avy ivy projectile sunrise-x-modeline sunrise-x-buttons sunrise-commander twittering-mode zerodark-theme pretty-mode flycheck-clang-analyzer flycheck-irony flycheck yasnippet-snippets yasnippet company-c-headers company-shell company-irony irony irony-mode company-lua mark-multiple expand-region swiper popup-kill-ring dmenu ido-vertical-mode ido-vertical ox-html5slide centered-window-mode htmlize ox-twbs diminish erc-hl-nicks symon rainbow-mode switch-window dashboard smex company sudo-edit emms magit org-bullets hungry-delete beacon linum-relative spaceline fancy-battery exwm which-key use-package)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(sml-modeline-mode t))
 '(elfeed-db-directory "~/.emacs.d/.elfeed")
 '(flycheck-display-errors-delay 0.3)
 '(flycheck-stylelintrc "~/.stylelintrc.json")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "Bits" :family "Bitstream Vera Sans Mono"))))
 '(fringe ((t (:background "#292b2e")))))
(put 'narrow-to-region 'disabled nil)
