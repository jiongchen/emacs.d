;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Theme
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-enabled-themes (quote (tango-dark)))
;;  '(package-selected-packages
;;    (quote
;;     (elpy lsp-mode flycheck-rust cargo rust-mode projectile yasnippet rainbow-delimiters neotree helm flycheck dockerfile-mode avy))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

(global-set-key [f9] 'compile)
;; (global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; new setting for line number
(global-display-line-numbers-mode t)
;; (tool-bar-mode -1)

(setq column-number-mode t)
(setq confirm-kill-emacs 'y-or-n-p)

;; load path
(add-to-list 'load-path' "~/.emacs.d/local")


;; C++ and octave mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cxx\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.
;; See `package-archive-priorities` and `package-pinned-packages`.
;; Most users will not need or want to do this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; C++ style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(put 'downcase-region 'disabled nil)

;; js
(setq js-indent-level 2)

;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))
(autoload 'cmake-mode "~/.emacs.d/local/cmake-mode.el" t)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Highlight parentheses
;;(require 'highlight-parentheses)
;;(define-globalized-minor-mode global-highlight-parentheses-mode
;;  highlight-parentheses-mode
;;  (lambda ()
;;    (highlight-parentheses-mode t)))
;;(global-highlight-parentheses-mode t)

;; Code hiding
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'ess-mode-hook        'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(global-set-key [f1] 'hs-toggle-hiding)


;; Rainbow delimiters
(add-to-list 'load-path "~/.emacs.d/elpa/rainbow-delimiters-2.1.3")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ;; Maxima
;; (add-to-list 'load-path "/usr/share/maxima/5.32.1/emacs/")
;; (autoload 'maxima-mode "maxima" "Maxima mode" t)
;; (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
;; (autoload 'maxima "maxima" "Maxima interaction" t)
;; (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
;; (setq imaxima-use-maxima-mode-flag t)
;; (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))


;; Flycheck
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; Swith-window
;; (require 'switch-window)
;; (global-set-key (kbd "C-x o") 'switch-window)

;; ;; Rust
;; (add-to-list 'load-path "~/.emacs.d/3rd/rust-mode/")
;; (autoload 'rust-mode "rust-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;; ;; (add-hook 'rust-mode-hook (lambda () (setq indent-tabs-mode nil)))
;; (add-hook 'rust-mode-hook (lambda () (setq tab-width 2)))

;; Eletric pair
(electric-pair-mode 1)

;; 
(setq compilation-scroll-output t)

;; avoid jump when scrolling
(setq scroll-margin 3
      scroll-conservatively 10000)

;; automatic expand
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;; ;; mark and jump
;; (global-set-key [(control ?\.)] 'ska-point-to-register)
;; (global-set-key [(control ?\,)] 'ska-jump-to-register)
;; (defun ska-point-to-register()
;;   "Store cursorposition _fast_ in a register.
;; Use ska-jump-to-register to jump back to the stored
;; position."
;;   (interactive)
;;   (setq zmacs-region-stays t)
;;   (point-to-register 8))

;; (defun ska-jump-to-register()
;;   "Switches between current cursorposition and position
;; that was stored with ska-point-to-register."
;;   (interactive)
;;   (setq zmacs-region-stays t)
;;   (let ((tmp (point-marker)))
;;         (jump-to-register 8)
;;         (set-register 8 tmp)))


;; ;; yasnippet
;; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.10.0")
;; (require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         ))
;; (yas-global-mode 1)
;; (setq yas-trigger-key "TAB")


;; ;; flyspell
;; (add-hook 'latex-mode-hook 'flyspell-mode)

;; ;; neo-tree
;; (add-to-list 'load-path "~/.emacs.d/elpa/neotree-0.5.2")
;; (require 'neotree)
;; (global-set-key [f8] 'neotree-toggle)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq dired-dwim-target t)

;; Helm: incremental navigation for commands, buffers, and files.
(unless (package-installed-p 'helm)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'helm))

(require 'helm-config)
(helm-mode 1)

(global-set-key [remap execute-extended-command] #'helm-M-x)
(global-set-key [remap switch-to-buffer] #'helm-mini)
(global-set-key [remap find-file] #'helm-find-files)
(global-set-key (kbd "C-f") #'helm-find-files)

(defun my-helm-M-x-complete-command ()
  "Complete the Helm M-x input with the selected command."
  (interactive)
  (helm-set-pattern (substring-no-properties (helm-get-selection))))

(with-eval-after-load 'helm-command
  (define-key helm-M-x-map (kbd "TAB") #'my-helm-M-x-complete-command)
  (define-key helm-M-x-map (kbd "<tab>") #'my-helm-M-x-complete-command))

;; auto complete
(add-to-list 'load-path "~/.emacs.d/3rd/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/3rd/popup-el")
(add-to-list 'load-path "~/.emacs.d/3rd/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/3rd/auto-complete/dict")
(ac-config-default)

;;(require 'dockerfile-mode)
;;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; (projectile-mode +1)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; (add-to-list 'load-path "~/.emacs.d/3rd/julia-emacs")
;; (require 'julia-mode)

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helm flycheck yasnippet rainbow-delimiters neotree auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
