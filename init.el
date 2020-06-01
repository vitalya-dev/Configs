
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

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
;(global-set-key (kbd "M-n") 'other-window)
;(global-set-key (kbd "M-p") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-M-b") (lambda () (interactive (forward-sexp -1))))
(global-set-key (kbd "M-SPC") 'mark-word)
(global-set-key (kbd "C-.") 'repeat)
;(global-set-key (kbd "C-v") 'scroll-up-line)
;(global-set-key (kbd "M-v") 'scroll-down-line)
(global-set-key (kbd "C-v") 'vscode)
(global-set-key (kbd "C-c C-r") 're-builder)
(global-set-key (kbd "C-t") 'search-c-tag)
(global-set-key (kbd "M-t") 'search-c-tag-recursive)
(global-set-key (kbd "M-n")
                (lambda() (interactive)
                  (scroll-other-window next-screen-context-lines)))

(global-set-key (kbd "M-p")
                (lambda() (interactive)
                  (scroll-other-window (* -1 next-screen-context-lines))))


(add-hook 'c-mode-hook
          (lambda ()
            (c-set-offset 'case-label '+)
            (local-set-key (kbd "C-M-i") 'dabbrev-expand)
            (local-set-key (kbd "C-M-p") 'imenu)))


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
(setenv "LANG" "ru_RU.CP1251")

(setq-default indent-tabs-mode nil)
(setq search-whitespace-regexp ".*?")


(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'csharp-mode)

(setq default-directory "C:/Users/Vitalya/Desktop/")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;;global emacs variables
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq inhibit-startup-message t)
(setq auto-save-mode nil)
(setq-default cursor-type '(hbar . 5)) 
;;(setq show-paren-style 'expression)
(global-auto-revert-mode t)

(defun run-cmd ()
  (interactive)
  (shell "*cmd*")
  (set-buffer-process-coding-system 'cp1251 'utf-8))   

(defun search-c-tag ()
  (interactive
   (grep (concat "grep -nHRr -C 3 " (find-tag-default) " *.c *.h"))))
(defun search-c-tag-recursive ()
  (interactive
   (rgrep (find-tag-default) "*.c *.h" "." nil)))

(defun functions ()
  (interactive)
  (imenu--cleanup)
  (setq imenu-menubar-modified-tick -1)
  (setq imenu--index-alist nil)
  (setq imenu--last-menubar-index-alist nil)
  (imenu-update-menubar)
  (with-output-to-temp-buffer "functions"
    (mapcar (lambda (i) (print (format "%s" (car i)))) (cdr (imenu--make-index-alist)))))


(defun vscode ()
  (interactive)
  (call-process
   "C:\\Users\\Vitalya\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe"
   nil
   nil
   nil
   "-g"
   (format "%s:%d:%d" (buffer-file-name) (line-number-at-pos) (+ (current-column) 1))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight bold :height 241 :width normal))))
 '(font-lock-builtin-face ((t (:foreground "white"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "yellow2"))))
 '(font-lock-comment-face ((t (:foreground "yellow2"))))
 '(font-lock-constant-face ((t (:foreground "white"))))
 '(font-lock-function-name-face ((t (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "yellow2"))))
 '(font-lock-string-face ((t (:foreground "yellow2"))))
 '(font-lock-type-face ((t (:foreground "white"))))
 '(font-lock-variable-name-face ((t (:foreground "white"))))
 '(font-lock-warning-face ((t (:inherit nil :foreground "yellow2"))))
 '(mode-line ((t (:background "green4" :foreground "yellow" :box (:line-width -1 :style released-button) :height 0.7))))
 '(region ((t (:background "black" :foreground "snow"))))
 '(show-paren-match ((t (:foreground "green")))))

(server-start)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-save-buffers nil)
 '(grep-use-null-device nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
