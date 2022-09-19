;;Automatically set path
(setenv "PATH" (concat (getenv "PATH") ":/home/cosmic/.local/bin"))
(setq exec-path (append exec-path '("/home/cosmic/.local/bin")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(transpose-frame cmake-font-lock lsp-cmake flycheck smartparens autopair company-box typescript-mode lsp-ivy dired-hide-dotfiles dired-single all-the-icons-dired vterm lsp-dart dart-mode dired visual-fill-column helpful org-bullets magit general evil-collection all-the-icons doom-themes counsel ivy-rich which-key rainbow-delimiters doom-modeline dap-mode color-theme-sanityinc-tomorrow pdf-tools phi-autopair projectile helm-lsp helm clang-capf company lsp-ui lsp-mode dracula-theme evil)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (set-face-attribute 'default nil :font "FiraCode")
;; (set-face-attribute 'variable-pitch nil :font "Roboto" :height 180 :weight 'regular)
;; (set-face-attribute 'default nil :height 140)

(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil :font "FiraCode" :height 140)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "FiraCode")

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "Roboto" :height 180 :weight 'regular))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                ;; (setq doom-modeline-icon t)
                (with-selected-frame frame
                  (efs/set-font-faces))))
    (efs/set-font-faces))
;; Custom Commands
(defun random-alnum () "Helper function for new-vterm."
  (let* ((alnum "abcdefghijklmnopqrstuvwxyz0123456789")
         (i (% (abs (random)) (length alnum))))
    (substring alnum i (1+ i))))

(defun find-config () "Open config file." (interactive)
       (find-file "~/.emacs"))
(defun new-vterm ()  "Give a random name to current buffer." (interactive)
       (if (equal (buffer-name) "*vterm*")
	   (rename-buffer (concat "Terminal: "
			      (random-alnum)
			      (random-alnum)
			      (random-alnum)
			      (random-alnum)
			      (random-alnum))) 'false)
       (tab-bar-new-tab)
       (vterm))
(defun proper-close-tab () "Closes tab and kill buffer." (interactive)
       (kill-this-buffer)
       (tab-bar-close-tab))
	
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
	  (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(setq inhibit-startup-message t)

(column-number-mode)
(global-display-line-numbers-mode)
 ;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
   (package-install 'use-package))


;; Theme
(load-theme 'doom-palenight)

(add-hook 'after-init-hook 'global-company-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'use-package)
(setq use-package-always-ensure t)

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
    (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
    (add-hook 'elisp-mode-hook #'lsp)
    (add-hook 'python-mode-hook #'lsp)
    (add-hook 'c++-mode-hook #'lsp)
    (add-hook 'dart-mode-hook #'lsp)
    (lsp-semantic-tokens-mode)
  )

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package ivy
  :diminish
  
  :bind (("C-s" . swiper)
	    :map ivy-minibuffer-map
	    ("TAB" . ivy-alt-done)	
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
  :config
  (ivy-mode 1))
(use-package color-theme-sanityinc-tomorrow)
(use-package dap-mode)
(require 'dap-cpptools)
(dap-cpptools-setup)
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package which-key
  :init (which-key-mode)
  :diminish whick-key-mode
  :config
  (setq which-key-idle-delay 0.3))
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)))

(use-package ivy-rich
  :init (ivy-rich-mode 1))
(use-package doom-themes)
(use-package all-the-icons)
(use-package evil-collection
  :after evil
  )
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config				
  (general-create-definer rune/leader-keys
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "C-SPC")

  (rune/leader-keys
   "t" '(:ignore t :which-key "toggles")
   "tt" '(counsel-load-theme :which-key "choose theme")
   "b" '(counsel-switch-buffer :whick-key "switch buffers")
   "v" '(new-vterm :whick-key "vterm")
   "c" '(find-config :which-key "config")
   "x" '(proper-close-tab :whick-key "kill buffer and close tab")
   "K" '(close-all-buffers :whick-key "kills all buffers")
   ))

;; keybinds
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "J") 'tab-bar-switch-to-prev-tab)
(define-key evil-normal-state-map (kbd "K") 'tab-bar-switch-to-next-tab)
(define-key evil-insert-state-map (kbd "M-l") 'forward-char)
(define-key evil-insert-state-map (kbd "M-h") 'backward-char)
(define-key evil-insert-state-map (kbd "M-o") 'newline)
(define-key evil-window-map (kbd "t") 'tab-bar-new-tab)
(define-key evil-window-map (kbd "x") 'tab-bar-close-tab)

(use-package projectile
  :diminish projectile-mode
  :config(projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/coding")
    (setq projectile-project-search-path '("~/coding")))
  )
(use-package magit)

;; Org Mode Configuration ------------------------------------------------------

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(require 'org-faces)

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(with-eval-after-load 'org-faces
;; Increase the size of various headings
(set-face-attribute 'org-document-title nil :font "Roboto" :weight 'bold :height 1.3)
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Roboto" :weight 'regular :height (cdr face))) ;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("cpp" . "src cpp"))
(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (efs/org-font-setup)
 (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-refile-targets
    '(("archive.org" :maxlevel . 1)
      ("tasks.org" :maxlevel . 1)))

;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-agenda-files '("~/Documents/org/tasks.org"
			   "~/Documents/org/archive.org")))


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  )
(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))


(use-package recentf
  :init (recentf-mode 1)
  :config (global-set-key "\C-x\ \C-r" 'recentf-open-files)
          (setq recentf-max-menu-items 25))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

(use-package dart-mode)
(use-package lsp-dart)
(add-hook 'dart-mode-hook 'lsp)

(use-package vterm
  :config(setq vterm-shell "fish"))
(use-package smartparens
  :init (smartparens-global-mode))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :hook (cmake-mode . lsp-deferred))

(use-package cmake-font-lock
  :after cmake-mode
  :config (cmake-font-lock-activate))

;; Kill active processes with no confirmation
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))


;; Set tab mode to indent four
(setq-default c-basic-offset 4)

(use-package transpose-frame)
