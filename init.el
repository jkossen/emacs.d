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
   '("0998a5646f4a322ba70ca51cf7db727cb75eec2cf1fca0a28442e72142b170ce" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "75636d4a6c176bf53bef4b0b525fbb9cd84837a2a7d66daf7d15273883070806" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" default))
 '(delete-old-versions t)
 '(dired-sidebar-theme 'vscode)
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/Users/jochem/go/bin" "/usr/local/bin"))
 '(fringe-mode '(0 . 5) nil (fringe))
 '(inhibit-startup-screen t)
 '(ivy-display-style 'fancy)
 '(kept-new-versions 16)
 '(kept-old-versions 4)
 '(line-number-mode nil)
 '(lsp-volar-take-over-mode t)
 '(mark-even-if-inactive nil)
 '(ns-alternate-modifier 'super)
 '(ns-command-modifier 'meta)
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   '(twittering-mode olivetti modus-themes org-roam yasnippet-snippets dired-sidebar doom-one company-mode company vscode-icon hl-todo org-bullets doom-themes vs-dark-theme vs-light-theme zenburn-theme yasnippet lsp-ui lsp-mode eglot web-mode typescript-mode vue-mode go-mode projectile deft magit markdown-mode swiper doom-modeline ivy command-log-mode use-package))
 '(recentf-max-menu-items 25)
 '(recentf-max-saved-items 25)
 '(recentf-mode t)
 '(right-margin 2)
 '(safe-local-variable-values
   '((eval setq-local org-roam-directory
	   (expand-file-name "./"))))
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
 '(default ((t (:height 180 :width normal :family "SF Mono"))))
 '(hl-todo ((t (:inherit hl-todo :italic t)))))

(setq
 default-directory "~/"
 command-line-default-directory "~/"
 mac-option-key-is-meta nil
 mac-command-key-is-meta t
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(setenv "PATH" (concat (getenv "PATH") ":/Users/jochem/go/bin:/usr/local/bin"))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )

(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-c\C-r" 'reload-dotemacs)
(global-set-key (kbd "C-<left>") 'backward-word)
(global-set-key (kbd "C-<right>") 'forward-word)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key "\C-c\ l" 'org-store-link)
(global-set-key "\C-c\C-i" (lambda() (interactive)(find-file "~/org/index.org")))
(global-set-key (kbd "<C-tab>") 'yas-expand)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; visually wrap long lines in markdown-mode
(add-hook 'markdown-mode-hook #'visual-line-mode)

(eval-after-load "artist"
  '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
  )

;; Initialize package sources
(require 'package)

(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))

;; https://emacs.stackexchange.com/questions/68288/error-retrieving-https-elpa-gnu-org-packages-archive-contents
;; Error retrieving: https://elpa.gnu.org/packages/archive-contents
(when (and (equal emacs-version "27.2")
           (eql system-type 'darwin))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

;; (use-package doom-themes
;; 	     :ensure t
;; 	     :config
;; 	     (load-theme 'doom-one t)
;; )

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi t)
  )

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package magit
  :ensure t)

(use-package swiper
  :ensure t)

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

(use-package company
  :ensure t
  :config
  ;; Company mode
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (add-hook 'after-init-hook 'global-company-mode)
  )

;; set up lsp support
(use-package lsp-mode
  :hook (web-mode . lsp)
  :commands lsp
  :config
  (setq lsp-eldoc-render-all t)
  )

(use-package yasnippet-snippets
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  ;; Go - lsp-mode
  ;; Set up before-save hooks to format buffer and add/delete imports.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  ;; Start LSP Mode and YASnippet mode
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'go-mode-hook #'yas-minor-mode))

(use-package web-mode
  :mode (
	 ".vue$"
	 ".js$"
	 ".ts$"
	 ".html$"
	 ".blade.php$"
	 )
  :config
  (add-hook 'web-mode-hook #'lsp))

;; icons for dired-sidebar
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
  :bind (("<f6>" . deft-personal)
	 ("<f7>" . deft-work))
  )

;;(defun deft-personal ()
;;(setq deft-directory "~/notes"
;;      deft-use-filename-as-title t
;;      deft-extensions '("md"))
;;  (deft)
;;  )
;;(defun deft-work ()
(setq deft-directory "~/work/notes"
      deft-use-filename-as-title t
      deft-extensions '("md"))
;;  (deft)
;;  )

;;
;; org-mode
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; some bits from Emacs From Scratch
;; see https://github.com/daviwil/emacs-from-scratch/blob/master/init.el
;;
(set-face-attribute 'default nil :font "SF Mono" :height 180)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "SF Mono" :height 180)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 180 :weight 'regular)

(defun org-mode-setup ()
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))
;;
;; /some bits from Emacs From Scratch
;; /see https://github.com/daviwil/emacs-from-scratch/blob/master/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'org-mode-setup)
(add-hook 'org-mode-hook 'yas-minor-mode)


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

(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(setq org-roam-directory (file-truename "~/org"))

(require 'ox-publish)

(setq org-publish-project-alist
      `(("pages"
         :base-directory "~/org/jkossen.nl"
         :base-extension "org"
         :recursive t
	 :html-doctype "html5"
	 :html-html5-fancy t
	 :html-head-include-scripts nil
	 :html-head-include-default-style nil
	 :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"/>" 
         :publishing-directory "~/jkossen.nl/public/"
         :publishing-function org-html-publish-to-html
	:html-preamble "<nav>
  <a href=\"/\">&lt; Home</a>
</nav>
<div id=\"updated\">Updated: %C</div>
<main>
"
 
	:html-postamble "
</main>
<hr/>
<footer>
  <div class=\"copyright-container\">
    <div class=\"copyright\">
      Copyright &copy; 2016-2022 Jochem Kossen some rights reserved<br/>
    </div>
    </div>
  </div>

  <div class=\"generated\">
    Created with %c
  </div>
</footer>")

        ("static"
         :base-directory "~/org/jkossen.nl"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png\\|svg"
         :recursive t
         :publishing-directory  "~/jkossen.nl/public/"
         :publishing-function org-publish-attachment)

        ("jkossen.nl" :components ("pages" "static"))))


;; (use-package org-roam
;;   :ensure t)

;; (org-roam-db-autosync-mode)


;; (defun roam-sitemap (title list)
;;   (concat "#+OPTIONS: ^:nil author:nil html-postamble:nil\n"
;;           "#+SETUPFILE: ./simple_inline.theme\n"
;;           "#+TITLE: " title "\n\n"
;;           (org-list-to-org list) "\nfile:sitemap.svg"))

;; (setq my-publish-time 0)   ; see the next section for context
;; (defun roam-publication-wrapper (plist filename pubdir)
;;   (org-roam-graph)
;;   (org-html-publish-to-html plist filename pubdir)
;;   (setq my-publish-time (cadr (current-time))))

;; (setq org-publish-project-alist
;;       '(("roam"
;; 	 :base-directory "~/org"
;; 	 :auto-sitemap t
;; 	 :sitemap-function roam-sitemap
;; 	 :sitemap-title "Roam notes"
;; 	 :publishing-function roam-publication-wrapper
;; 	 :publishing-directory "~/roam-export"
;; 	 :section-number nil
;; 	 :table-of-contents nil
;; 	 :style "<link rel=\"stylesheet\" href=\"../other/mystyle.css
;; \" type=\"text/css\">")))

(defun reload-dotemacs ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el") )
