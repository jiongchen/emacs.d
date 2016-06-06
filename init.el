;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key [f9] 'compile)
(global-set-key "\C-x\C-b" 'buffer-menu)

(global-linum-mode t)
(tool-bar-mode -1)

;; load path
(add-to-list 'load-path' "/home/jerry/.emacs.d")


;; C++ style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(put 'downcase-region 'disabled nil)


;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-mode "/home/jerry/.emacs.d/cmake-mode.el" t)


;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; guess dired operation target
;; (setq dired-dwim-target t)

;; ;;########################################
;; ;;cscope
;; ;;LOAD_PATH       
;; ;;(add-to-list 'load-path "/home/tfjiang/app/emacs/cscope")
;; 					;(require 'xcscope)

;; ;;########################################
;; ;;org mode
;; 					;(add-to-list 'load-path "/home/tfjiang/app/emacs/org-7.4")
;; 					;(require 'org)
;; 					;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; 					;(define-key global-map "\C-cl" 'org-store-link)
;; 					;(define-key global-map "\C-ca" 'org-agenda)
;; 					;(setq org-hide-leading-stars t)
;; 					;(setq org-log-done t)

;; ;;########################################
;; 					; auto complete  gccsense
;; 					;(add-to-list 'load-path "/home/tfjiang/app/emacs/auto-complete-1.3.1")  
;; 					;(require 'auto-complete-config)  
;; 					;(add-to-list 'ac-dictionary-directories "/home/tfjiang/app/emacs/auto-complete-1.3.1/dict")  
;; 					;(ac-config-default)  

;; 					;(add-to-list 'load-path "/home/tfjiang/app/emacs/gccsense-0.1/etc")  
;; 					;(require 'gccsense)  
;; 					;(global-set-key (kbd "C-?") 'ac-complete-gccsense)
;; ;;##########################################

;; ;;#########################################
;; ;;gdb
;; (global-set-key [f9] 'compile)
;; (add-hook 'gdb-mode-hook '(lambda ()
;;                             (define-key c-mode-base-map [(f5)] 'gud-go)
;;                             (define-key c-mode-base-map [(f7)] 'gud-step)
;;                             (define-key c-mode-base-map [(f8)] 'gud-next)))

;; 					;##########################################
;; ;;hotkeys
;; (global-set-key (kbd "s-/") 'comment-region)
;; (global-set-key (kbd "s-\\") 'uncomment-region)

;; (global-set-key (kbd "C-j") 'goto-line)

;; ;;(set-default-font "Courier 10 Pitch-11")

;; ;; 用ibuffer代替默认的buffer switch
;; ;; 参考 http://www.emacswiki.org/emacs/IbufferMode
;; ;; ibuffer是emacs自带的，可用 M-x ibuffer 调出来
;; ;; 下面只是将快捷键 C-x C-b 映射为调出ibuffer的命令
;; ;; 在ibuffer中的操作方式和dired mode一样
;; ;; n和p是上下，m是选中该文件，可选多个，D是kill buffer
;; ;; 回车或者按e(就是edit)来编辑文件
;; ;; 在ibuffer页面，用英文斜线来通过关键字过滤缩小显示文件范围
;; ;; 比如 “ /日记 ” ，就会只显示buffer名称中有日记这两个字的
;; ;; / 后面支持正则表达式 如 /200?
;; ;; 撤销过滤按两下/，就是按 “ // ”
;; ;; 在ibuffer中，按英文等号 “ = ” 对为保存文件和它上一个保存版本做diff 
;; ;; 按 g 刷新文件目录      
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (autoload 'ibuffer "ibuffer" "List buffers." t)

;; ;;*****************************************
;; ;;global setting
;; ;;全屏
;; (defun my-fullscreen ()
;;   (interactive)
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(2 "_NET_WM_STATE_FULLSCREEN" 0))
;;   )
;; ;;最大化
;; (defun my-maximized ()
;;   (interactive)
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;   )
;; (my-maximized) ;启动emacs时窗口最大化

;; (setq x-select-enable-clipboard t)
;; (setq c-tab-always-indent nil)

;; ;; data and time
;; (setq display-time-day t
;;       display-time-24hr-format t)
;; (display-time)

;; ;; toolbar
;; (setq tool-bar-map (make-sparse-keymap))

;; ;; deadline
;; (defun insert-time-stamp()
;;   (interactive)
;;   (let ((hour (nth 2 (decode-time)))
;; 	(sec (nth 0 (decode-time)))
;; 	(min (nth 1 (decode-time)))
;; 	(day (nth 3 (decode-time)))
;; 	(mon (nth 4 (decode-time)))
;; 	(year (nth 5 (decode-time))))
;;     (insert (format "%d/%d/%d %d:%d:%d" year mon day hour min sec))
;;     )
;;   )
;; (global-set-key (kbd "C-x t") 'insert-time-stamp)
;; ;;******************************************

;; ;;###################################
;; ;;C/C++语言启动时自动加载semantic对/usr/include的索引数据库
;; (setq semanticdb-search-system-databases t)
;; (add-hook 'c-mode-common-hook
;; 	  (lambda ()
;; 	    (setq semanticdb-project-system-databases
;; 		  (list (semanticdb-create-database
;; 			 semanticdb-new-database-class
;; 			 "/usr/include")))))


;; 					;##################################
;; ;;set the window display
;; 					;(add-to-list 'load-path "/homt/tfjiang/app/emacs/")
;; 					;(require 'linum)
;; 					;(global-linum-mode 1)

;; (set-foreground-color "grey")
;; (set-background-color "black")
;; (set-cursor-color "gold1")
;; (set-mouse-color "gold1")

;; ;; (add-to-list 'load-path  "/home/tfjiang/app/emacs/color-theme-6.6.0")
;; ;; (require 'color-theme)
;; ;; (load-file "/home/tfjiang/app/emacs/color-theme-6.6.0/my-color-theme")
;; ;; (my-color-theme)
;; ;; (color-theme-gnome2)

;; (customize-set-variable 'scroll-bar-mode 'right)
;; (setq frame-title-format  
;;       '("%S" (buffer-file-name "%f"  
;; 			       (dired-directory dired-directory "%b"))))  

;; 					;(add-to-list 'load-path "/home/tfjiang/app/emacs")
;; 					;(require 'tabbar)
;; 					;(tabbar-mode)
;; 					;(global-set-key (kbd "<s-up>") 'tabbar-backward-group)
;; 					;(global-set-key (kbd "<s-down>") 'tabbar-forward-group)
;; 					;(global-set-key (kbd "<s-left>") 'tabbar-backward)
;; 					;(global-set-key (kbd "<s-right>") 'tabbar-forward)
;; ;;;; 设置tabbar外观
;; ;;设置默认主题: 字体, 背景和前景颜色，大小
;; ;;(set-face-attribute 'tabbar-default nil
;; ;;                   :family "DejaVu Sans Mono"
;; ;;                   :background "gray80"
;; ;;                   :foreground "gray30"
;; ;;                   :height 1.0
;; ;;                    )
;; ;; 设置左边按钮外观：外框框边大小和颜色
;; ;;(set-face-attribute 'tabbar-button nil
;; ;;                    :inherit 'tabbar-default
;; ;;                    :box '(:line-width 1 :color "gray30")
;; ;;                    )
;; ;; 设置当前tab外观：颜色，字体，外框大小和颜色
;; ;;(set-face-attribute 'tabbar-selected nil
;; ;;                    :inherit 'tabbar-default
;; ;;                    :foreground "DarkGreen"
;; ;;                    :background "LightGoldenrod"
;; ;;                    :box '(:line-width 2 :color "DarkGoldenrod")
;; ;;                    ;; :overline "black"
;; ;;                    ;; :underline "black"
;; ;;                    :weight 'bold
;; ;;                    )
;; ;; 设置非当前tab外观：外框大小和颜色
;; ;;(set-face-attribute 'tabbar-unselected nil
;; ;;                    :inherit 'tabbar-default
;; ;;                    :box '(:line-width 2 :color "gray70")
;; ;;                    )
;; ;; ;;##################################

;; ;;#########################################
;; 					;(require 'psvn)
;; ;;#########################################

;; ;;#########################################
;; ;;refresh buffer
;; (defun refresh-file ()
;;   (interactive)
;;   (revert-buffer t t t)
;;   )
;; (global-set-key [f5] 'refresh-file)
;; ;;#########################################

;; ;;################################
;; 					;cedet
;; 					;(load-file "/home/tfjiang/app/emacs/cedet-1.0/common/cedet.el")
;; 					;(require 'cedet)
;; 					;(semantic-load-enable-minimum-features)
;; 					;(semantic-load-enable-code-helpers)

;; ;;代码折叠
;; 					;(load-file "/home/tfjiang/app/emacs/cedet-1.0/contrib/semantic-tag-folding.el")
;; 					;(require 'semantic-tag-folding nil 'noerror)
;; 					;(global-semantic-tag-folding-mode 1)
;; 					;(define-key semantic-tag-folding-mode-map (kbd "C-\-") 'semantic-tag-folding-fold-block)
;; 					;(define-key semantic-tag-folding-mode-map (kbd "C-\=") 'semantic-tag-folding-show-block)

;; ;;代码跳转
;; 					;(global-set-key [f12] 'semantic-ia-fast-jump)
;; ;;跳回来
;; 					;(global-set-key [S-f12]
;; 					;                (lambda ()
;; 					;                  (interactive)
;; 					;                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;; 					;                      (error "Semantic Bookmark ring is currently empty"))
;; 					;                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
;; 					;                         (alist (semantic-mrub-ring-to-assoc-list ring))
;; 					;                         (first (cdr (car alist))))
;; 					;                    (if (semantic-equivalent-tag-p (oref first tag)
;; 					;                                                   (semantic-current-tag))
;; 					;                        (setq first (cdr (car (cdr alist)))))
;; 					;                    (semantic-mrub-switch-tags first))))
;; ;;函数名显示在mode-line上
;; (which-function-mode 1)
;; ;;##################################

;; ;;#################################
;; ;;ecb

;; 					;(global-ede-mode 1)
;; 					;(add-to-list 'load-path' "/home/tfjiang/app/emacs/ecb-2.40")
;; 					;(require 'ecb-autoloads)
;; 					;(setq ecb-auto-activate t
;; 					;      ecb-tip-of-the-day nil)
;; 					;(setq ecb-tip-of-the-day nil)
;; ;;##################################

;; ;; ;; 自动补全代码  
;; ;; (global-set-key [(meta ?/)] 'hippie-expand)  
;; ;; (setq hippie-expand-try-functions-list  
;; ;;       '(try-expand-dabbrev  
;; ;;     try-expand-dabbrev-visible  
;; ;;     try-expand-dabbrev-all-buffers  
;; ;;     try-expand-dabbrev-from-kill  
;; ;;     try-complete-file-name-partially  
;; ;;     try-complete-file-name  
;; ;;     try-expand-all-abbrevs  
;; ;;     try-expand-list  
;; ;;     try-expand-line  
;; ;;     try-complete-lisp-symbol-partially  
;; ;;     try-complete-lisp-symbol))  

;; ;; ;;##############################################
;; ;; ;;auctex
;; ;; ;(add-to-list 'load-path "/home/tfjiang/app/emacs/auctex-11.86")
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)

;; (setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

;; (add-hook 'LaTeX-mode-hook
;; 	  (lambda()
;; 	    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;; 	    (setq TeX-command-default "XeLaTeX")))

;; ;;##################################################


;; (put 'dired-find-alternate-file 'disabled nil)

;; ;;(setq default-tab-width 2)

;; ;; ;doxymacs
;; ;; (require 'doxymacs)
;; ;; (add-hook 'c-mode-common-hook 'doxymacs-mode)

;; (require 'ibus)
;; (add-hook 'after-init-hook 'ibus-mode-on)
;; (global-unset-key (kbd "C-SPC"))
;; (global-set-key (kbd "C-SPC") 'ibus-toggle)

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(column-number-mode t)
;;  '(display-time-mode t)
;;  '(scroll-bar-mode (quote right)))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Droid Sans Mono")))))


;; (add-to-list 'load-path "/usr/share/asymptote")
;; (autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
;; (autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
;; (autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
;; (add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))
