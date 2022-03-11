(setq inhibit-startup-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.saves" t)))
 '(backup-by-copying t)
 '(backup-directory-alist '(("." . "~/.saves/")))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(custom-safe-themes
   '("1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "75636d4a6c176bf53bef4b0b525fbb9cd84837a2a7d66daf7d15273883070806" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" default))
 '(delete-old-versions t)
 '(dired-sidebar-theme 'vscode)
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/Users/jochem/go/bin" "/usr/local/bin"))
 '(fringe-mode '(0 . 5) nil (fringe))
 '(ivy-display-style 'fancy)
 '(kept-new-versions 6)
 '(line-number-mode nil)
 '(lsp-volar-take-over-mode t)
 '(mark-even-if-inactive nil)
 '(ns-alternate-modifier 'super)
 '(ns-command-modifier 'meta)
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   '(company-mode company vscode-icon hl-todo org-bullets doom-themes vs-dark-theme vs-light-theme zenburn-theme yasnippet lsp-ui lsp-mode eglot web-mode typescript-mode vue-mode go-mode projectile deft magit markdown-mode swiper doom-modeline ivy command-log-mode use-package))
 '(recentf-max-menu-items 25)
 '(recentf-max-saved-items 25)
 '(recentf-mode t)
 '(right-margin 2)
 '(scroll-bar-mode nil)
 '(tab-stop-list
   '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(version-control t)
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 160 :width normal :family "SF Mono"))))
 '(hl-todo ((t (:inherit hl-todo :italic t)))))

(setq
  default-directory "~/"
  command-line-default-directory "~/"
  mac-option-key-is-meta nil
  mac-command-key-is-meta t
  )

(defalias 'yes-or-no-p 'y-or-n-p)

(setenv "PATH" (concat (getenv "PATH") ":/Users/jochem/go/bin:/usr/local/bin"))

(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;;(load-theme 'vs-light t)
;;(load-theme 'zenburn t)
(load-theme 'doom-one t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; visually wrap long lines in markdown-mode
(add-hook 'markdown-mode-hook #'visual-line-mode)

;; Initialize package sources
(require 'package)

;;(setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;                         ("org" . "https://orgmode.org/elpa/")
;;                         ("elpa" . "https://elpa.gnu.org/packages/")))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)


;; https://emacs.stackexchange.com/questions/68288/error-retrieving-https-elpa-gnu-org-packages-archive-contents
;; Error retrieving: https://elpa.gnu.org/packages/archive-contents
;;(when (and (equal emacs-version "27.2")
;;           (eql system-type 'darwin))
;;  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))


(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(eval-after-load "artist"
   '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
   )

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)


(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)  
  (projectile-mode +1))

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

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package ivy :demand
  :config
  (setq ivy-use-virtual-buffers t    ;; Add recent files and bookmarks to the ivy-switch-buffer
        ivy-count-format "%d/%d "    ;; Displays the current and total number in the collection in the prompt
	))

(use-package hl-todo
       :ensure t
       :custom-face
       (hl-todo ((t (:inherit hl-todo :italic t))))
       :hook ((prog-mode . hl-todo-mode)
              (yaml-mode . hl-todo-mode)))

;; set up lsp support
(use-package lsp-mode
  :hook (web-mode . lsp)
  :commands lsp)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

;; for completions
;(use-package company-lsp
;  :after lsp-mode
;  :config (push 'company-lsp company-backends))


(use-package web-mode
  :mode "\\.vue\\'"
  :config
  (add-hook 'web-mode-hook #'lsp))

(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(use-package deft
  :bind ("<f6>" . deft)
  :commands (deft)
  :config (setq deft-directory "~/notes"
		deft-use-filename-as-title t
                deft-extensions '("md")))

(use-package deft
  :bind ("<f7>" . deft)
  :commands (deft)
  :config (setq deft-directory "~/OneDrive - Landstede Groep/notes"
		deft-use-filename-as-title t
                deft-extensions '("md")))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance '("crypt"))

(setq org-crypt-key nil)
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.

(setq auto-save-default nil)
;; Auto-saving does not cooperate with org-crypt.el: so you need to
;; turn it off if you plan to use org-crypt.el quite often.  Otherwise,
;; you'll get an (annoying) message each time you start Org.

;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(defun reload-dotemacs ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el") )

