;;Basic Setup

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" "20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" "78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" default))
 '(fci-rule-color "#383838")
 '(initial-frame-alist '((fullscreen . maximized)))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(ansible powershell python-mode ## monokai-theme flycheck-color-mode-line magit flycheck auto-complete yaml-mode json-mode))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 110 :width normal)))))

;; Package repo

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
;; (package-refresh-contents)

;; Default Directory Windows ONLY
(setq default-directory "c:/Users/asivaramanr/OneDrive - DXC Production/Documents/Visualstudio/")
(setq command-line-default-directory "c:/Users/asivaramanr/OneDrive - DXC Production/Documents/Visualstudio/")

;; auto-complete
(
  require 'auto-complete)
(global-auto-complete-mode t)
(set-default 'ac-modes
             '(
               python-mode
               yaml-mode 
               json-mode
               org-mode
               powershell-mode
               ansible
               ))

;; flycheck config

(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

;;Org mode 

(require 'org)
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "VERIFY" "CANCELED" "KNOWNCAUSE" "|" "DONE" "DELEGATED" "FIXED" )))

;; Orgmode as word Processor

(setq org-hide-emphasis-markers t)
;; Better bullets
 (font-lock-add-keywords 'org-mode
                            '(("^ +\\([-*]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; JSON mode

(require 'json-mode)

;;Yaml mode

(require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
   (add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
   (add-hook 'yaml-mode-hook '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ansible

;;(setq ansible-vault-password-file "path/to/pwd/file")
(global-set-key (kbd "C-c b") 'ansible-decrypt-buffer)
(global-set-key (kbd "C-c g") 'ansible-encrypt-buffer)
(add-hook 'ansible-hook 'ansible-auto-decrypt-encrypt)
