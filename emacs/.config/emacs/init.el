(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

;;; OS specific config
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))

(setq inhibit-startup-message t) ;; no startup screen
(setq initial-scratch-message "") ;; no scratch buffer message

;; increase garbage collection threshold
(setq gc-cons-threshold #x40000000)

;; maximum reading process output size (allows for larger data transfers)
(setq read-process-output-max (* 1024 1024 4))

(scroll-bar-mode -1) ;; disable scrollbar
(tool-bar-mode -1) ;; disable toolbar
(menu-bar-mode -1) ;; disable menubar
(tooltip-mode -1) ;; disable tooltips
(set-fringe-mode 10) ;; some breathing room

(setq visible-bell t) ;; enable visual bell

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(set-face-attribute 'default nil :font "Iosevka Term Slab Nerd Font Mono" :height 150)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'package)
(setq package-archives
      '(("melpa-stable" . "http://stable.melpa.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("org-elpa" . "https://orgmode.org/elpa/")))


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq
 use-package-always-ensure t ;; download new packages if not downloaded already
 use-package-verbose t) ;; add logging for package installs

;;  ;; slurp environment variables from the shell.
;; (use-package exec-path-from-shell
;;   :config
;;   (exec-path-from-shell-initialize))

;; nerd fonts
(defcustom ek-use-nerd-fonts t
  "Configuration for using Nerd Fonts Symbols."
  :type 'boolean
  :group 'appearance)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


(use-package magit)
(use-package swiper)
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy
  :diminish
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

;; project management
(use-package projectile
  :init
  (projectile-mode t) ;; enable immediately
  :config
  (setq projectile-enable-caching t
        projectile-completion-system 'ivy))

;; Counsel and projectile should work together.
(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package company
  :bind (("C-." . company-complete))
  :custom
  (company-idle-delay 0) ;; I always want completion, give it to me asap
  (company-dabbrev-downcase nil "Don't downcase returned candidates.")
  (company-show-numbers t "Numbers are helpful.")
  (company-tooltip-limit 10 "The more the merrier.")
  :config
  (global-company-mode) ;; We want completion everywhere

  ;; use numbers 0-9 to select company completion candidates
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
				  `(lambda () (interactive) (company-complete-number ,x))))
          (number-sequence 0 9))))

;; Flycheck is the newer version of flymake and is needed to make lsp-mode not freak out.
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode) ;; always lint my code
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; Package for interacting with language servers
(use-package lsp-mode
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil ;; Flymake is outdated
        lsp-headerline-breadcrumb-mode nil))

;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (XXX-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(evil-numbers helm-lsp which-key magit lsp-ui lsp-ivy ivy-rich helpful evil-surround doom-themes doom-modeline dap-mode counsel)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

(use-package evil
  :ensure t
  :config
  (evil-mode 1))
;; (evil-want-fine-undo 1))
(setq evil-undo-system 'undo-tree)
(setq evil-insert 'bar)
(setq evil-normal-state-cursor 'box)
(setq evil-visual-state-cursor 'box)
(setq evil-motion-state-cursor 'box)
(setq evil-motion-state-cursor 'box)
(setq evil-operator-state-cursor 'solid-block)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; (use-package evil-numbers
;; 	     :config
;; 	     (global-evil-surround-mode 1)
;; 	     :bind (
;; 		:map evil-normal-state-map
;; 		("C-a" . 'evil-numbers/inc-at-pt)
;; 		("C-x" . 'evil-numbers/dec-at-pt)))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(exec-path-from-shell evil-commentary which-key magit lsp-ui lsp-ivy ivy-rich helpful evil-surround evil-numbers doom-themes doom-modeline dap-mode counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
