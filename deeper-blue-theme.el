(deftheme deeper-blue
  "Created 2019-02-24.")

(custom-theme-set-faces
 'deeper-blue
 '(compilation-column-number ((((class color) (min-colors 89)) (:foreground "LightGreen"))))
 '(compilation-error ((((class color) (min-colors 89)) (:foreground "Red1"))))
 '(compilation-info ((((class color) (min-colors 89)) (:weight normal :foreground "LightSkyBlue"))))
 '(compilation-line-number ((((class color) (min-colors 89)) (:foreground "LightGreen"))))
 '(compilation-mode-line-exit ((((class color) (min-colors 89)) (:foreground "blue4"))))
 '(cursor ((((class color) (min-colors 89)) (:background "green"))))
 '(dired-marked ((((class color) (min-colors 89)) (:background "dodgerblue3" :foreground "white"))))
 '(error ((((class color) (min-colors 89)) (:foreground "red"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "LightCoral"))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:foreground "gray50"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "gray50"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "DarkOliveGreen3"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "moccasin"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "goldenrod"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "DeepSkyBlue1"))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "gold"))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:weight bold))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "burlywood"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "CadetBlue1"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "SeaGreen2"))))
 '(fringe ((((class color) (min-colors 89)) (:background "black"))))
 '(highlight ((((class color) (min-colors 89)) (:background "DodgerBlue4"))))
 '(ido-first-match ((((class color) (min-colors 89)) (:weight normal :foreground "orange"))))
 '(ido-only-match ((((class color) (min-colors 89)) (:foreground "green"))))
 '(ido-subdir ((((class color) (min-colors 89)) (:foreground nil :inherit font-lock-keyword-face))))
 '(isearch ((((class color) (min-colors 89)) (:background "coral2" :foreground "white"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:background "coral4" :foreground "white"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:background "cadetblue" :foreground "white"))))
 '(match ((((class color) (min-colors 89)) (:background "DeepPink4"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:foreground "CadetBlue1"))))
 '(mode-line ((((class color) (min-colors 89)) (:background "gray75" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:weight bold :background nil :foreground "blue4"))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:background "gray40" :foreground "black" :box (:line-width 1 :color "gray40" :style nil)))))
 '(region ((((class color) (min-colors 89)) (:background "#103050"))))
 '(success ((((class color) (min-colors 89)) (:foreground "SeaGreen2"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "Yellow"))))
 '(default ((((class color) (min-colors 89)) (:background "#181a26" :foreground "gray80")))))

(provide-theme 'deeper-blue)
