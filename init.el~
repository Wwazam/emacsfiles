(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "cd06decefb02a5358264f9964c68a8ffeb02e0dcf7c987a9d55b419d8ee8d233" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3eb8dec7c15ce9eb3584ec9846175d963f838eaeccf2490f8ab3daff59862212" "9541f1dc11258239ef02aa1a5e9db3e1e46bc8fb1d7dbe83946c1541ae6dbdf9" default)))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-capture-templates
   (quote
    (("j" "Journal entry" entry
      (file "~/org/notes.org")
      "\\t%U %^{Title}\\n%?"))) t)
 '(package-selected-packages
   (quote
    (projectile fill-column-indicator chess smart-mode-line-powerline-theme smart-mode-line diminish powerline-evil buffer-move 0blayout visual-fill-column auctex ace-jump-mode org-bullets zenburn-theme monokai-theme sentence-highlight org-journal rainbow-delimiters magit minesweeper evil-leader helm windsize autopair elpy importmagic jedi key-chord inkpot-theme rebecca-theme toxi-theme evil)))
 '(preview-gs-options
   (quote
    ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#3F3F3F" :foreground "#9FC59F" :underline nil :height 0.75)))))


(load "~/.emacs.d/var.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ACE MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "C-.") 'ace-jump-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               AUTO-COMPLETE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               BUFF-MOVE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               EMACS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start in full screen
 ;; start maximized

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(load-theme 'zenburn)
(global-linum-mode t)

(setq show-paren-delay 0)
(show-paren-mode 1)

(require 'autopair) ;; automatically pair up ()[]{}
(autopair-global-mode)

(global-set-key (kbd "C-=") 'calculator)

(require 'sentence-highlight)
(add-hook 'org-mode-hook 'auto-fill-mode)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Hide scroll bars
(scroll-bar-mode -1)

(blink-cursor-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               HELM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm-config)

(global-set-key (kbd "C-x b") 'helm-buffers-list) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               JEDI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               MAGIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ORG-MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-todo-keywords
      '((sequence "NOW(n)" "TODO(t)" "CHECK(c)" "LATER(l)" "|" "DONE(d)")
      (sequence "BUG(b)" "ISSUE(i)" "|" "FIXED(f)")
      (sequence "|" "CANCELED(a)")))

(setq org-todo-keywords-faces
      '(("NOW" . "DeepSkyBlue3") ("TODO" . "LightSkyBlue1") ("DONE" . "SpringGreen2") ("LATER" . "pink") ("CHECK" . "DarkGoldenrod")
	("BUG" . "red") ("ISSUE" . "OrangeRed") ("FIXED" . "SpringGreen2")
	("CANCELED" . "SpringGreen3")))

(require 'org-bullets)
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda ()(org-bullets-mode 1)))
(setq org-bullets-bullet-list '("•"))

(setq org-ellipsis " ▼")

;; hide the // or ** or +--+ or __ when stylizing 
(setq org-hide-emphasis-markers t)

;; auto indent text in headings
(setq org-startup-indented 1)

;; setup interpreters for source code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; org capture
(define-key global-map "\C-cc" 'org-capture)
(setq org-default-notes-file "c:\\Users\\bpracca\\Documents\\_Notes\\capture\\note.org")




;; An override for this function to make inserting headings work
;; a bit better. Makes O respect heading content.
(defun shellhead/smart-org-insert ()
  "Creates a new heading if currently in a heading, creates a new list item 
   if in a list, or creates a newline if neither."
  (interactive)
  (cond
   ((org-at-heading-p) (org-insert-heading-respect-content) (evil-insert-state))
   ((org-at-item-p) (org-insert-item))))

(defun evil-org-eol-call (fun)
    "Go to end of line and call provided function.
  FUN function callback"
    (end-of-visible-line)
    (funcall fun)
    (evil-append nil)
    )


(defun org-tree-open-in-right-frame ()
  (interactive)
  (org-tree-to-indirect-buffer)
  (windmove-right))

(add-hook 'org-mode-hook 
          (lambda ()
            ;; TODO: set fringe/gutter mode and theme by mode, no fringe and white them for ORG files
            ;; fringe and black theme for code
            (fringe-mode 0)
            
            ;; (set-frame-parameter (window-frame) 'background-mode 'dark)
            ;; (enable-theme 'leuven)

            (define-key evil-normal-state-local-map [S-return] (quote org-tree-open-in-right-frame))
            (define-key evil-normal-state-local-map [return] (quote org-tree-to-indirect-buffer))
))

(define-key global-map (kbd "C-c h")
  (lambda ()
    (interactive)
    (delete-other-windows)
    (split-window-right)
    (enlarge-window-horizontally -9999)
    (enlarge-window-horizontally 50)
  ))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "C://Users//bpracca//Documents//_Notes//TODO//todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "C://Users//bpracca//Documents//_Notes//diary.org")
             "* %?\nEntered on %U\n  %i\n  %a")
	("n" "Note" entry (file (concat org-directory "/gtd.org"))
	     "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)))
(define-key global-map (kbd "C-c f t")
  (lambda () (interactive)(find-file "C://Users//bpracca//Documents//_Notes//TODO//todo.org")))
(define-key global-map (kbd "C-c f j")
  (lambda () (interactive)(find-file "C://Users//bpracca//Documents//_Notes//diary.org")))
(define-key global-map (kbd "C-c f i")
  (lambda () (interactive)(find-file "~/.emacs.d/init.el")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               POWER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'powerline)
;(powerline-evil-vim-color-theme)
;(display-time-mode t)
;(setq powerline-arrow-shape 'triangles)

(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'powerline)
(sml/setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               EVIL-MODE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'key-chord)
;; Delay to press command
(setq key-chord-two-keys-delay 1)
(key-chord-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               SHORTCUTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(evil-leader/set-key "/" 'evil-ex-nohighlight)

(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(global-evil-leader-mode)
(evil-leader/set-key
  "f" 'helm-find-files
  "b" 'helm-mini
  "-" 'text-scale-decrease
  "+" 'text-scale-increase
  "x" 'helm-M-x
  "r" 'helm-M-x
  "k" 'kill-buffer)
(evil-leader/set-key-for-mode 'org-mode
  "t"  'org-show-todo-tree
  "a"  'org-agenda
  "c"  'org-archive-subtree
  "l"  'evil-org-open-links
  "o"  'org-open-at-point
  "e"  'outline-show-branches
)
(put 'narrow-to-region 'disabled nil)
