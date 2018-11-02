
(use-package zenburn-theme
  :ensure t
  :init
    (load-theme 'zenburn t))

(set-face-bold-p 'bold nil)

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(when window-system (add-hook 'prog-mode-hook 'hl-line-mode))

(setq make-backup-files t)
(setq auto-save-default t)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package async
  :ensure t
  :init (dired-async-mode 1))

(setq evil-search-module 'evil-search
        evil-want-C-u-scroll t
        evil-want-C-w-in-emacs-state t)

(use-package evil
  :ensure t)

(evil-mode t)

(use-package key-chord
    :ensure t)
(setq key-chord-two-keys-delay 1)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)

(define-key global-map (kbd "C-." ) nil)
(global-unset-key (kbd "C-."))

;(use-package evil-leader
    ;:ensure t)
;(evil-leader/set-leader "<SPC>")
;(global-evil-leader-mode)
;(evil-leader/set-key
;"a" 'org-agenda
;"b" 'helm-buffers-list
;"f" 'helm-find-files
;"k" 'kill-current-buffer
;"o" 'evil-org-open-link
;"t" 'org-show-todo-tree
;"-" 'text-scale-decrease
;"+" 'text-scale-increase
;"." 'avy-goto-word-1)

(use-package evil-numbers
    :ensure t)
(global-set-key (kbd "C-+") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C--") 'evil-numbers/dec-at-pt)

(use-package elscreen
    :ensure t)
(elscreen-start)
(elscreen-set-prefix-key "\C-l")
(setq elscreen-display-tab nil)
(global-set-key (kbd "C-l C-l") 'elscreen-swap)

;  (use-package exwm
;    :ensure t
;    :config
;
;      ;; necessary to configure exwm manually
;      (require 'exwm-config)
;
;      ;; fringe size, most people prefer 1 
;      (fringe-mode 3)
;      
;      ;; emacs as a daemon, use "emacsclient <filename>" to seamlessly edit files from the terminal directly in the exwm instance
;      (server-start)
;
;      ;; this fixes issues with ido mode, if you use helm, get rid of it
;      (exwm-config-ido)
;
;      ;; a number between 1 and 9, exwm creates workspaces dynamically so I like starting out with 1
;      (setq exwm-workspace-number 1)
;
;      ;; this is a way to declare truly global/always working keybindings
;      ;; this is a nifty way to go back from char mode to line mode without using the mouse
;      (exwm-input-set-key (kbd "s-r") #'exwm-reset)
;      (exwm-input-set-key (kbd "s-k") #'exwm-workspace-delete)
;      (exwm-input-set-key (kbd "s-w") #'exwm-workspace-swap)
;
;      ;; the next loop will bind s-<number> to switch to the corresponding workspace
;      (dotimes (i 10)
;        (exwm-input-set-key (kbd (format "s-%d" i))
;                            `(lambda ()
;                               (interactive)
;                               (exwm-workspace-switch-create ,i))))
;
;      ;; the simplest launcher, I keep it in only if dmenu eventually stopped working or something
;      (exwm-input-set-key (kbd "s-&")
;                          (lambda (command)
;                            (interactive (list (read-shell-command "$ ")))
;                            (start-process-shell-command command nil command)))
;
;      ;; an easy way to make keybindings work *only* in line mode
;      (push ?\C-q exwm-input-prefix-keys)
;      (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)
;
;      ;; simulation keys are keys that exwm will send to the exwm buffer upon inputting a key combination
;      (exwm-input-set-simulation-keys
;       '(
;         ;; movement
;         ([?\C-b] . left)
;         ([?\M-b] . C-left)
;         ([?\C-f] . right)
;         ([?\M-f] . C-right)
;         ([?\C-p] . up)
;         ([?\C-n] . down)
;         ([?\C-a] . home)
;         ([?\C-e] . end)
;         ([?\M-v] . prior)
;         ([?\C-v] . next)
;         ([?\C-d] . delete)
;         ([?\C-k] . (S-end delete))
;         ;; cut/paste
;         ([?\C-w] . ?\C-x)
;         ([?\M-w] . ?\C-c)
;         ([?\C-y] . ?\C-v)
;         ;; search
;         ([?\C-s] . ?\C-f)))
;
;      ;; this little bit will make sure that XF86 keys work in exwm buffers as well
;      (dolist (k '(XF86AudioLowerVolume
;                 XF86AudioRaiseVolume
;                 XF86PowerOff
;                 XF86AudioMute
;                 XF86AudioPlay
;                 XF86AudioStop
;                 XF86AudioPrev
;                 XF86AudioNext
;                 XF86ScreenSaver
;                 XF68Back
;                 XF86Forward
;                 Scroll_Lock
;                 print))
;      (cl-pushnew k exwm-input-prefix-keys))
;      
;      ;; this just enables exwm, it started automatically once everything is ready
;      (exwm-enable))

(use-package dmenu
  :ensure t
  :bind
    ("s-SPC" . 'dmenu))

;  (defun exwm-async-run (name)
;    (interactive)
;    (start-process name nil name))
;
;  (defun daedreth/launch-discord ()
;    (interactive)
;    (exwm-async-run "discord"))
;
;  (defun daedreth/launch-browser ()
;    (interactive)
;    (exwm-async-run "qutebrowser"))
;
;  (defun daedreth/lock-screen ()
;    (interactive)
;    (exwm-async-run "slock"))
;
;  (defun daedreth/shutdown ()
;    (interactive)
;    (start-process "halt" nil "sudo" "halt"))

(global-set-key (kbd "s-d") 'daedreth/launch-discord)
(global-set-key (kbd "<s-tab>") 'daedreth/launch-browser)
(global-set-key (kbd "<XF86ScreenSaver>") 'daedreth/lock-screen)
(global-set-key (kbd "<XF86PowerOff>") 'daedreth/shutdown)

; (defconst volumeModifier "4")

;  (defun audio/mute ()
;    (interactive)
;    (start-process "audio-mute" nil "pulsemixer" "--toggle-mute"))
;
;  (defun audio/raise-volume ()
;    (interactive)
;    (start-process "raise-volume" nil "pulsemixer" "--change-volume" (concat "+" volumeModifier)))
;
;  (defun audio/lower-volume ()
;    (interactive)
;    (start-process "lower-volume" nil "pulsemixer" "--change-volume" (concat "-" volumeModifier)))

; (global-set-key (kbd "<XF86AudioMute>") 'audio/mute)
; (global-set-key (kbd "<XF86AudioRaiseVolume>") 'audio/raise-volume)
; (global-set-key (kbd "<XF86AudioLowerVolume>") 'audio/lower-volume)

;  (defun daedreth/take-screenshot ()
;    "Takes a fullscreen screenshot of the current workspace"
;    (interactive)
;    (when window-system
;    (loop for i downfrom 3 to 1 do
;          (progn
;            (message (concat (number-to-string i) "..."))
;            (sit-for 1)))
;    (message "Cheese!")
;    (sit-for 1)
;    (start-process "screenshot" nil "import" "-window" "root" 
;               (concat (getenv "HOME") "/" (subseq (number-to-string (float-time)) 0 10) ".png"))
;    (message "Screenshot taken!")))
;  (global-set-key (kbd "<print>") 'daedreth/take-screenshot)

;  (defun daedreth/take-screenshot-region ()
;    "Takes a screenshot of a region selected by the user."
;    (interactive)
;    (when window-system
;    (call-process "import" nil nil nil ".newScreen.png")
;    (call-process "convert" nil nil nil ".newScreen.png" "-shave" "1x1"
;                  (concat (getenv "HOME") "/" (subseq (number-to-string (float-time)) 0 10) ".png"))
;    (call-process "rm" nil nil nil ".newScreen.png")))
;  (global-set-key (kbd "<Scroll_Lock>") 'daedreth/take-screenshot-region)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")

(use-package projectile
  :ensure t
  :init
    (projectile-mode 1))

(global-set-key (kbd "<f5>") 'projectile-compile-project)

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.emacs.d/img/dashLogo.png")
    (setq dashboard-items '((recents  . 5)
                            (projects . 5)))
    (setq dashboard-banner-logo-title ""))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))

(setq powerline-default-separator nil)

(setq line-number-mode t)
(setq column-number-mode t)

(setq display-time-24hr-format t)
(setq display-time-format "%H:%M - %d %B %Y")

(display-time-mode 1)

(use-package fancy-battery
  :ensure t
  :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 15)
    (if window-system
      (fancy-battery-mode)
      (display-battery-mode)))

(use-package symon
  :ensure t
  :bind
  ("s-h" . symon-mode))

;  (use-package sunrise-commander
;    :ensure t
;    :init
;      (use-package sunrise-x-buttons :ensure t)
;      (use-package sunrise-x-modeline :ensure t)
;      (setq sr-cursor-follows-mouse nil)
;      (define-key sr-mode-map [mouse-1] nil)
;      (define-key sr-mode-map [mouse-movement] nil)
;    :bind ("s-t" . sunrise))

(use-package ivy
  :ensure t)

(setq scroll-conservatively 100)

(use-package which-key
  :ensure t
  :config
    (which-key-mode))

(use-package switch-window
  :ensure t
  :config
    (setq switch-window-input-style 'minibuffer)
    (setq switch-window-increase 4)
    (setq switch-window-threshold 2)
    (setq switch-window-shortcut-style 'qwerty)
    (setq switch-window-qwerty-shortcuts
        '("a" "o" "e" "u" "h" "t" "n" "n" "s"))
  :bind
    ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper))

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert t)

(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)

(use-package linum
    :ensure t
    :config
      (setq linum-relative-current-symbol "")
      (add-hook 'prog-mode-hook 'linum-mode)
)
(setq linum-format "%d ")

(use-package helm
  :ensure t
  :bind
  ("C-x C-f" . 'helm-find-files)
  ("C-x C-b" . 'helm-buffers-list)
  ("M-x" . 'helm-M-x)
  :config
  (defun daedreth/helm-hide-minibuffer ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face
                     (let ((bg-color (face-background 'default nil)))
                       `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))
  (add-hook 'helm-minibuffer-set-up-hook 'daedreth/helm-hide-minibuffer)
  (setq helm-autoresize-max-height 0
        helm-autoresize-min-height 40
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t
        helm-split-window-in-side-p nil
        helm-move-to-line-cycle-in-source nil
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8 
        helm-echo-input-in-header-line t)
  :init
  (helm-mode 1))

(require 'helm-config)    
(helm-autoresize-mode 1)
(define-key helm-find-files-map (kbd "C-w") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "C-f") 'helm-execute-persistent-action)

(use-package avy
    :ensure t)
(define-key evil-normal-state-map(kbd "C-.") 'avy-goto-word-1)

(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(global-set-key (kbd "<s-return>") 'ansi-term)

(use-package mark-multiple
  :ensure t
  :bind ("C-c q" . 'mark-next-like-this))

(defun daedreth/kill-inner-word ()
  "Kills the entire word your cursor is in. Equivalent to 'ciw' in vim."
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w k") 'daedreth/kill-inner-word)

(defun daedreth/copy-whole-word ()
  (interactive)
  (save-excursion
    (forward-char 1)
    (backward-word)
    (kill-word 1)
    (yank)))
(global-set-key (kbd "C-c w c") 'daedreth/copy-whole-word)

(defun daedreth/copy-whole-line ()
  "Copies a line without regard for cursor position."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c l c") 'daedreth/copy-whole-line)

(global-set-key (kbd "C-c l k") 'kill-whole-line)

(define-key global-map (kbd "C-c f c")
  (lambda () (interactive)(find-file "~/.emacs.d/config.org")))
(define-key global-map (kbd "C-c f f")
  (lambda () (interactive)(find-file "~/documents/notes/files.org")))
(define-key global-map (kbd "C-c f h")
  (lambda () (interactive)(find-file "~/documents/notes/horraires.org")))
(define-key global-map (kbd "C-c f i")
  (lambda () (interactive)(find-file "~/.emacs.d/init.el")))
(define-key global-map (kbd "C-c f j")
  (lambda () (interactive)(find-file "~/documents/notes/diary.org")))
(define-key global-map (kbd "C-c f t")
  (lambda () (interactive)(find-file "~/documents/notes/todo.org")))

(defun config-reload ()
  "Reloads ~/.emacs.d/config.org at runtime"
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(global-subword-mode 0)

(setq electric-pair-pairs '(
                           (?\{ . ?\})
                           (?\( . ?\))
                           (?\[ . ?\])
                           (?\" . ?\")
                           ))

(electric-pair-mode t)

(use-package beacon
  :ensure t
  :config
    (beacon-mode 1))

(use-package rainbow-mode
  :ensure t
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

(show-paren-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(use-package hungry-delete
  :ensure t
  :config
    (global-hungry-delete-mode))

(use-package zzz-to-char
  :ensure t
  :bind ("M-z" . zzz-up-to-char))

(setq completion-ignore-case t)

(setq kill-ring-max 100)

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package yasnippet
  :ensure t
  :config
    (use-package yasnippet-snippets
      :ensure t)
    (yas-reload-all))
(define-key yas-minor-mode-map (kbd "<C-SPC>") 'yas-expand)

(use-package flycheck
  :ensure t)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort))

(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)

(use-package flycheck-clang-analyzer
  :ensure t
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-clang-analyzer)
     (flycheck-clang-analyzer-setup)))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

(use-package company-c-headers
  :ensure t)

(use-package company-irony
  :ensure t
  :config
  (setq company-backends '((company-c-headers
                            company-dabbrev-code
                            company-irony))))

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(add-hook 'python-mode-hook 'yas-minor-mode)

(add-hook 'python-mode-hook 'flycheck-mode)

(with-eval-after-load 'company
    (add-hook 'python-mode-hook 'company-mode))

(use-package company-jedi
  :ensure t
  :config
    (require 'company)
    (add-to-list 'company-backends 'company-jedi))

(defun python-mode-company-init ()
  (setq-local company-backends '((company-jedi
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-jedi
  :ensure t
  :config
    (require 'company)
    (add-hook 'python-mode-hook 'python-mode-company-init))

(add-hook 'python-mode-hook 'hs-minor-mode)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)

(add-hook 'emacs-lisp-mode-hook 'company-mode)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package slime-company
  :ensure t
  :init
    (require 'company)
    (slime-setup '(slime-fancy slime-company)))

(add-hook 'lua-mode-hook 'yas-minor-mode)

(add-hook 'lua-mode-hook 'flycheck-mode)

(add-hook 'lua-mode-hook 'company-mode)

(defun custom-lua-repl-bindings ()
  (local-set-key (kbd "C-c C-s") 'lua-show-process-buffer)
  (local-set-key (kbd "C-c C-h") 'lua-hide-process-buffer))

(defun lua-mode-company-init ()
  (setq-local company-backends '((company-lua
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-lua
  :ensure t
  :config
    (require 'company)
    (setq lua-indent-level 4)
    (setq lua-indent-string-contents t)
    (add-hook 'lua-mode-hook 'custom-lua-repl-bindings)
    (add-hook 'lua-mode-hook 'lua-mode-company-init))

(add-hook 'shell-mode-hook 'yas-minor-mode)

(add-hook 'shell-mode-hook 'flycheck-mode)

(add-hook 'shell-mode-hook 'company-mode)

(defun shell-mode-company-init ()
  (setq-local company-backends '((company-shell
                                  company-shell-env
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-shell
  :ensure t
  :config
    (require 'company)
    (add-hook 'shell-mode-hook 'shell-mode-company-init))

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("C-x g" . magit-status))

(use-package sudo-edit
  :ensure t
  :bind
    ("s-e" . sudo-edit))

(setq org-ellipsis " ")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook 'org-indent-mode)

(use-package htmlize
  :ensure t)

(add-hook 'org-mode-hook
          '(lambda ()
             (visual-line-mode 1)))

(global-set-key (kbd "C-c '") 'org-edit-src-code)

(use-package org-bullets
    :ensure t)
(setq org-bullets-fac-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda ()(org-bullets-mode 1)))

(setq org-bullets-bullet-list '("·"))

(setq org-ellipsis " ▼")

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(when (file-directory-p "/usr/share/emacs/site-lisp/tex-utils")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/tex-utils")
  (require 'xdvi-search))

(use-package ox-twbs
  :ensure t)

(setq org-todo-keywords 
'((sequence "NOW(n)" "TODO(t)" "CHECK(c)" "LATER(l)" "|" "DONE(d)" )
(sequence "BUG(b)" "ISSUE(i)" "|" "FIXED(f)")
(sequence "|" "CANCELED(a)")
))

(setq org-todo-keywords-faces
'(("NOW" . "DeepSkyBlue3") ("TODO" . "LightSkyBlue1") ("DONE" . "SpringGreen2") ("LATER" . "pink") ("CHECK" . "DarkGoldenrod")
("BUG" . "red") ("ISSUE" . "OrangeRed") ("FIXED" . "SpringGreen2")
("CANCELED" . "SpringGreen4")))

(define-key global-map "\C-cc" 'org-capture)

(setq org-ddefaults-notes-file "~/documents/notes/notes.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/documents/notes/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/documents/notes/diary.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("f" "Files" entry (file+headline "~/documents/notes/files.org" "Files")
        "* %?\n[[file:%F][%F]]")
        ))

(defun shellhead/smart-org-insert ()
  "Creates a new heading if currently in a heading, creates a new list item 
   if in a list, or creates a newline if neither."
  (interactive)
  (cond
   ((org-at-heading-p) (org-insert-heading-respect-content) (evil-insert-state))
   ((org-at-item-p) (org-insert-item))))

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

(use-package org-evil
    :ensure t)

(global-set-key (kbd "C-c a") 'org-agenda)

(use-package org-journal)

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "."))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "  ")))
      (concat str "  "))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

(setq org-clock-into-drawer t)

(setq erc-nick "daedreth")
(setq erc-prompt (lambda () (concat "[" (buffer-name) "]")))
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(setq erc-server-history-list '("irc.freenode.net"
                                "localhost"))

(use-package erc-hl-nicks
  :ensure t
  :config
    (erc-update-modules))

(use-package elcord
  :ensure t)

(use-package emms
  :ensure t
  :config
    (require 'emms-setup)
    (require 'emms-player-mpd)
    (emms-all) ; don't change this to values you see on stackoverflow questions if you expect emms to work
    (setq emms-seek-seconds 5)
    (setq emms-player-list '(emms-player-mpd))
    (setq emms-info-functions '(emms-info-mpd))
    (setq emms-player-mpd-server-name "localhost")
    (setq emms-player-mpd-server-port "6601")
  :bind
    ("s-m p" . emms)
    ("s-m b" . emms-smart-browse)
    ("s-m r" . emms-player-mpd-update-all-reset-cache)
    ("<XF86AudioPrev>" . emms-previous)
    ("<XF86AudioNext>" . emms-next)
    ("<XF86AudioPlay>" . emms-pause)
    ("<XF86AudioStop>" . emms-stop))

(setq mpc-host "localhost:6601")

(defun mpd/start-music-daemon ()
  "Start MPD, connects to it and syncs the metadata cache."
  (interactive)
  (shell-command "mpd")
  (mpd/update-database)
  (emms-player-mpd-connect)
  (emms-cache-set-from-mpd-all)
  (message "MPD Started!"))
(global-set-key (kbd "s-m c") 'mpd/start-music-daemon)

(defun mpd/kill-music-daemon ()
  "Stops playback and kill the music daemon."
  (interactive)
  (emms-stop)
  (call-process "killall" nil nil nil "mpd")
  (message "MPD Killed!"))
(global-set-key (kbd "s-m k") 'mpd/kill-music-daemon)

(defun mpd/update-database ()
  "Updates the MPD database synchronously."
  (interactive)
  (call-process "mpc" nil nil nil "update")
  (message "MPD Database Updated!"))
(global-set-key (kbd "s-m u") 'mpd/update-database)

(global-set-key (kbd "C-=") 'calculator)
(add-to-list 'evil-emacs-state-modes 'calculator-mode)

(use-package elfeed
  :ensure t
  :bind
      ("C-x w" . 'elfeed))
