;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("3e52c03d98538c5132e7d71514262dfeabe1acfd6b463db2ae39c59deb69bd83" default)))
 '(package-selected-packages
   (quote
    (rust-mode exec-path-from-shell ac-ispell flycheck yasnippet rainbow-delimiters neotree helm gscholar-bibtex dockerfile-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

(global-set-key [f9] 'compile)
;; (global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


(global-linum-mode t)
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
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; Configure package
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


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
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


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


;; Maxima
(add-to-list 'load-path "/usr/share/maxima/5.32.1/emacs/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))


;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)


;; Swith-window
;; (require 'switch-window)
;; (global-set-key (kbd "C-x o") 'switch-window)


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

;; mark and jump
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))


;; yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.10.0")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(yas-global-mode 1)
(setq yas-trigger-key "TAB")


;; flyspell
(add-hook 'latex-mode-hook 'flyspell-mode)
(put 'set-goal-column 'disabled nil)


;; neo-tree
(add-to-list 'load-path "~/.emacs.d/elpa/neotree-0.5.2")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq dired-dwim-target t)

(require 'helm-config)
(helm-mode 1)

;; ;; auto complete
;; (add-to-list 'load-path "~/.emacs.d/3rd/fuzzy-el")
;; (add-to-list 'load-path "~/.emacs.d/3rd/popup-el")
;; (add-to-list 'load-path "~/.emacs.d/3rd/auto-complete")

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/3rd/auto-complete/dict")
;; (ac-config-default)

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(setq exec-path (append "/usr/local/bin" exec-path))
(setq exec-path (append "/usr/local/texlive/2017/bin/x86_64-darwin" exec-path))

(getenv "PATH")
(setenv "PATH"
	(concat
	 "/usr/local/texlive/2019/bin/x86_64-darwin/"":"
	 (getenv "PATH")))

(setq ispell-program-name "/usr/local/bin/ispell")

;; rust
(add-to-list 'load-path "~/.emacs.d/3rd/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
