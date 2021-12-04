(set-background-color "#012456")
(set-foreground-color "White")

(show-paren-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode -1)
(global-font-lock-mode 1) 
(set-cursor-color "green")

                                        ;
;(toggle-debug-on-error)

;(require 'basic-mode)
;(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-mode))

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list)


(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "M-.") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-M-g") 'garbage-collect)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;(global-set-key (kbd "M-n") 'other-window)
;(global-set-key (kbd "M-p") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-M-b") (lambda () (interactive) (forward-sexp -1)))
(global-set-key (kbd "M-SPC") 'mark-word)
(global-set-key (kbd "C-.") 'repeat)
;(global-set-key (kbd "C-v") 'scroll-up-line)
;(global-set-key (kbd "M-v") 'scroll-down-line)
(global-set-key (kbd "C-c C-r") 're-builder)
(global-set-key (kbd "C-M-i") 'dabbrev-expand)


(global-set-key (kbd "M-n")
                (lambda() (interactive)
                  (scroll-other-window next-screen-context-lines)))

(global-set-key (kbd "M-p")
                (lambda() (interactive)
                  (scroll-other-window (* -1 next-screen-context-lines))))





(setq-default indent-tabs-mode nil)
(setq search-whitespace-regexp "[ \t\r\n]+")
(setq case-fold-search t)


;(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/emacs-gdscript-mode-1.4.0")
(require 'gdscript-mode)

(add-to-list 'load-path "~/.emacs.d/screenplay")
(require 'screenplay)

;(add-to-list 'load-path "~/.emacs.d/lsp-mode-master")
;(require `lsp-mode)



;(prefer-coding-system 'utf-8)
;(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)


;;global emacs variables
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq inhibit-startup-message t)
(setq auto-save-mode nil)
(setq-default cursor-type 'box)
;(setq-default cursor-type 'box)f
(setq-default blink-cursor-interval 0.1)
(setq-default blink-cursor-delay 0)
;;(setq show-paren-style 'expression)
(global-auto-revert-mode t)







(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)


(defun temp-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer-name "*temp*")))




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "green4" :foreground "yellow" :box (:line-width -1 :style released-button) :height 0.7))))
 '(region ((t (:background "#666" :foreground "snow"))))
 '(show-paren-match ((t (:foreground "green")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks -1)
 '(blink-cursor-delay 0)
 '(grep-save-buffers nil)
 '(grep-use-null-device nil)
 '(kill-ring-max 60)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(when (window-system)
  (set-frame-font "Fira Code Bold 18"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))
(server-start)


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
