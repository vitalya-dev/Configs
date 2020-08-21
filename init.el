
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-background-color "#012456")
(set-foreground-color "White")

(show-paren-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode -1)
(global-font-lock-mode 1) 
(set-cursor-color "green")

(setq gc-cons-threshold most-positive-fixnum)
                                        ;
;(toggle-debug-on-error)

;(require 'basic-mode)
;(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-mode))


(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-x m") 'execute-extended-command)
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
(global-set-key (kbd "C-v") 'vscode)
(global-set-key (kbd "C-c C-r") 're-builder)
(global-set-key (kbd "C-t") 'grep-search-under-cursor)
(global-set-key (kbd "M-k") 'view-kill)

(global-set-key (kbd "M-n")
                (lambda() (interactive)
                  (scroll-other-window next-screen-context-lines)))

(global-set-key (kbd "M-p")
                (lambda() (interactive)
                  (scroll-other-window (* -1 next-screen-context-lines))))



(add-hook 'buffer-menu-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") (lambda ()
                                         (interactive)
                                         (let ((b (buffer-name)))
                                           (Buffer-menu-this-window)
                                           (kill-buffer b))))))


(add-hook 'c-mode-hook
          (lambda ()
            (c-set-offset 'case-label '+)
            (local-set-key (kbd "C-M-i") 'dabbrev-expand)
            (local-set-key (kbd "M-c") 'uncomment-region)
            (local-set-key (kbd "C-M-p") 'imenu)))


(add-hook 'csharp-mode-hook
          (lambda ()
            (setq c-basic-offset 2)
            (setq-default indent-tabs-mode nil)))




;(setenv  "PATH" (concat
                 "C:\\Program Files\\Git\\usr\\bin" ";"
                 "C:\\Users\\Vitalya\\AppData\\Local\\Programs\\Python\\Python38-32" ";"
                 "C:\\Program Files\\Git\\cmd"
;                 ))
;(setenv  "PATH" (concat
                 "C:\\Program Files\\Git\\usr\\bin" ";"
                 "C:\\Users\\Vitalya\\AppData\\Local\\Programs\\Python\\Python38-32" ";"
                 "C:\\Program Files\\Git\\cmd"
;                 ))
(setenv "PATH"
  (concat
   "C:/cygwin64/usr/local/bin" ";"
   "C:/cygwin64/usr/bin" ";"
   "C:/cygwin64/bin" ";"
   (getenv "PATH")
  )
)

(setq-default indent-tabs-mode nil)
(setq search-whitespace-regexp "[ \t\r\n]+")
(setq case-fold-search t)


(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-gdscript-mode-master")
(require 'gdscript-mode)


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

(defun grep-search-under-cursor ()
  (interactive)
  (if (use-region-p)
      (grep (concat "grep -nHRr -C 3 "
                    (buffer-substring-no-properties (region-beginning) (region-end))
                    " *." (file-name-extension (buffer-file-name))))
    (grep (concat "grep -nHRr -C 3 "
                  (find-tag-default)
                  " *." (file-name-extension (buffer-file-name))))))




(defun vscode ()
  (interactive)
  (call-process
   "C:\\Users\\Vitalya\\AppData\\Local\\Programs\\VSCodium\\VSCodium.exe"
   nil
   nil
   nil
   "-g"
   (format "%s:%d:%d" (buffer-file-name) (line-number-at-pos) (+ (current-column) 1))))

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)


(defun view-kill ()
  (interactive)
  (let ((count 0))
    (switch-to-buffer (get-buffer-create "kill-ring-view") t)
    (local-set-key (kbd "q") 'kill-this-buffer)
    (dolist (x kill-ring)
      (insert (concat "----- " (number-to-string count) " -----"))
      (newline)
      (insert x)
      (newline)
      (newline)
      (setq count (+ count 1)))
    (goto-char (point-min))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight bold :height 181 :width normal))))
 '(font-lock-builtin-face ((t (:foreground "white"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "yellow2"))))
 '(font-lock-comment-face ((t (:foreground "yellow2"))))
 '(font-lock-constant-face ((t (:foreground "white"))))
 '(font-lock-doc-face ((t (:foreground "yellow"))))
 '(font-lock-function-name-face ((t (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white"))))
 '(font-lock-negation-char-face ((t (:foreground "white"))))
 '(font-lock-preprocessor-face ((t (:foreground "white"))))
 '(font-lock-string-face ((t (:foreground "yellow2"))))
 '(font-lock-type-face ((t (:foreground "white"))))
 '(font-lock-variable-name-face ((t (:foreground "white"))))
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
(server-start)

