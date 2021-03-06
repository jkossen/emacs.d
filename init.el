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
   '("dad40020beea412623b04507a4c185079bff4dcea20a93d8f8451acb6afc8358" "a0415d8fc6aeec455376f0cbcc1bee5f8c408295d1c2b9a1336db6947b89dd98" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "0998a5646f4a322ba70ca51cf7db727cb75eec2cf1fca0a28442e72142b170ce" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "75636d4a6c176bf53bef4b0b525fbb9cd84837a2a7d66daf7d15273883070806" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" default))
 '(delete-old-versions t)
 '(dired-sidebar-theme 'vscode)
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/Users/jochem/go/bin" "/usr/local/bin" "/opt/bin"))
 '(fringe-mode '(0 . 5) nil (fringe))
 '(gac-automatically-push-p t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-display-style 'fancy)
 '(kept-new-versions 16)
 '(kept-old-versions 4)
 '(line-number-mode nil)
 '(lsp-volar-take-over-mode t)
 '(mark-even-if-inactive nil)
 '(mu4e-drafts-folder "/Drafts")
 '(mu4e-sent-folder "/Sent")
 '(mu4e-trash-folder "/Trash")
 '(ns-alternate-modifier 'super)
 '(ns-command-modifier 'meta)
 '(org-agenda-files
   '("/Users/jochem/work/org/index.org.gpg" "~/work/org/bwijnolts.org.gpg"))
 '(org-cycle-separator-lines -1)
 '(org-download-image-dir "./img")
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-todo-keywords
   '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
 '(package-selected-packages
   '(org-present git-auto-commit-mode org-superstar org-appear mixed-pitch org-download ox-hugo mu4e-views ob-php org-contrib twittering-mode olivetti modus-themes org-roam yasnippet-snippets dired-sidebar doom-one company-mode company vscode-icon hl-todo org-bullets doom-themes vs-dark-theme vs-light-theme zenburn-theme yasnippet lsp-ui lsp-mode eglot web-mode typescript-mode vue-mode go-mode projectile deft magit markdown-mode swiper doom-modeline ivy command-log-mode use-package))
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
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(user-mail-address "jochem@jkossen.nl")
 '(version-control t)
 '(visible-bell t)
 '(warning-suppress-log-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-todo ((t (:inherit hl-todo :italic t)))))

(setq
 default-directory "~/"
 command-line-default-directory "~/"
 mac-option-key-is-meta nil
 mac-command-key-is-meta t
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(setenv "PATH" (concat (getenv "PATH") ":/Users/jochem/go/bin:/usr/local/bin:/opt/bin"))

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
(global-set-key "\C-c\ c" 'org-capture)
(global-set-key "\C-c\ l" 'org-store-link)
(global-set-key "\C-c\ h" (lambda() (interactive)(find-file "~/org/index.org")))
(global-set-key "\C-c\ j" (lambda() (interactive)(find-file "~/org/journal.org")))
(global-set-key "\C-c\ w" (lambda() (interactive)(find-file "~/work/org/index.org.gpg")))
(global-set-key (kbd "<C-tab>") 'yas-expand)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; visually wrap long lines in markdown-mode
(add-hook 'markdown-mode-hook #'visual-line-mode)

(eval-after-load "artist"
  '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
  )

(add-to-list 'load-path "/opt/share/emacs/site-lisp/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/notmuch")

;; Initialize package sources
(require 'package)

(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; -*- notmuch -*-
;; use notmuch from OS packages not elpa, since commandline utils and
;; elpa versions are not often the same
(setq send-mail-function 'sendmail-send-it)
(setq mail-host-address "jkossen.nl")
(setq user-full-name "Jochem Kossen")
(setq notmuch-archive-tags '("-inbox" "+archive"))
(setq notmuch-fcc-dirs "Sent")
(setq notmuch-search-oldest-first nil)
(setq notmuch-saved-searches
      '((:name "inbox" :query "tag:inbox" :key "i")
	(:name "unread" :query "tag:unread" :key "u")
	(:name "sent" :query "tag:sent" :key "s")
	(:name "drafts" :query "tag:draft" :key "d")
	(:name "all mail" :query "*" :key "a")
	(:name "Inbox" :query "folder:Inbox" :key "I")
	(:name "Gmail" :query "folder:gmail" :key "G")
	(:name "Junk" :query "folder:Junk" :key "J")
	(:name "Trash" :query "folder:Trash" :key "T")))
(require 'notmuch)

(use-package command-log-mode)

(use-package olivetti)

(use-package modus-themes)
(use-package doom-themes)
(load-theme 'doom-palenight t)

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package magit)
(use-package git-auto-commit-mode)

(use-package swiper)

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
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package ivy :demand
  :config
  (setq ivy-use-virtual-buffers t    ;; Add recent files and bookmarks to the ivy-switch-buffer
        ivy-count-format "%d/%d "    ;; Displays the current and total number in the collection in the prompt
	))

(use-package hl-todo
  :custom-face
  (hl-todo ((t (:inherit hl-todo :italic t))))
  :hook ((prog-mode . hl-todo-mode)
         (yaml-mode . hl-todo-mode)))

(use-package company
  :config
  ;; Company mode
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  ;;; Prevent suggestions from being triggered automatically. In particular,
  ;;; this makes it so that:
  ;;; - TAB will always complete the current selection.
  ;;; - RET will only complete the current selection if the user has explicitly
  ;;;   interacted with Company.
  ;;; - SPC will never complete the current selection.
  ;;;
  ;;; Based on:
  ;;; - https://github.com/company-mode/company-mode/issues/530#issuecomment-226566961
  ;;; - https://emacs.stackexchange.com/a/13290/12534
  ;;; - http://stackoverflow.com/a/22863701/3538165
  ;;;
  ;;; See also:
  ;;; - https://emacs.stackexchange.com/a/24800/12534
  ;;; - https://emacs.stackexchange.com/q/27459/12534

  ;; <return> is for windowed Emacs; RET is for terminal Emacs
  (dolist (key '("<return>" "RET"))
    ;; Here we are using an advanced feature of define-key that lets
    ;; us pass an "extended menu item" instead of an interactive
    ;; function. Doing this allows RET to regain its usual
    ;; functionality when the user has not explicitly interacted with
    ;; Company.
    (define-key company-active-map (kbd key)
      `(menu-item nil company-complete
                  :filter ,(lambda (cmd)
                             (when (company-explicit-action-p)
                               cmd)))))
  (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  (define-key company-active-map (kbd "SPC") nil)

  ;; Company appears to override the above keymap based on company-auto-complete-chars.
  ;; Turning it off ensures we have full control.
  (setq company-auto-complete-chars nil))


;; move point from window to window using Shift and the arrow keys.
;; https://www.emacswiki.org/emacs/WindMove
;; NOTE: 2022-05-18: disabled, conflicts with editing timestamps
;;(when (fboundp 'windmove-default-keybindings)
;;  (windmove-default-keybindings))

;; set up lsp support
(use-package lsp-mode
  :hook (web-mode . lsp)
  :commands lsp
  :config
  (setq lsp-eldoc-render-all t)
  )

(use-package yasnippet-snippets)

(use-package go-mode
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
  :commands (vscode-icon-for-file))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
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

;; Show hidden emphasis markers
(use-package org-appear
  :hook (org-mode . org-appear-mode))

(use-package org-present)

;; Setup fonts
(set-face-attribute 'bold nil :weight 'semi-bold)
(if (eql system-type 'darwin)
    (progn
      (set-face-attribute 'default nil :font "iA Writer Duo S" :height 180 :weight 'regular)
      (set-face-attribute 'fixed-pitch nil :font "iA Writer Duo S" :height 180 :weight 'regular)
      (set-face-attribute 'variable-pitch nil :font "Arial" :height 180 :weight 'regular))
  (progn
    (set-face-attribute 'default nil :font "iA Writer Duo S" :height 140 :weight 'regular)
    (set-face-attribute 'fixed-pitch nil :font "iA Writer Duo S" :height 140)
    (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 140 :weight 'regular)))

;;
;; org-mode
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; some bits from Emacs From Scratch
;; see https://github.com/daviwil/emacs-from-scratch/blob/master/init.el
;;

(defun org-mode-setup ()
  (setq org-log-done 'time)
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/org/index.org" "Todo")
           "* TODO %?\n" :prepend t)
	  ("T" "Work Todo" entry (file+headline "~/work/org/index.org.gpg" "Todo") "* TODO %?\n" :prepend t)
	  ("r" "Relevant Todo" entry (file+headline "~/org/index.org" "Todo")
           "* TODO %?\n  %i\n  %a" :prepend t)
          ("c" "Capture" entry (file+datetree "~/org/capture.org")
           "* %?\nEntered on %U\n  %i\n  %a"
	   "* TODO %?\n")
          ("w" "Work note" entry (file+datetree "~/work/org/capture.org.gpg")
           "* %?\nEntered on %U\n"))
	))
;;
;; /some bits from Emacs From Scratch
;; /see https://github.com/daviwil/emacs-from-scratch/blob/master/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'org-mode-setup)
(add-hook 'org-mode-hook 'yas-minor-mode)

;; Make windmove work in Org mode:
;; https://orgmode.org/manual/Conflicts.html
;;(add-hook 'org-shiftup-final-hook 'windmove-up)
;;(add-hook 'org-shiftleft-final-hook 'windmove-left)
;;(add-hook 'org-shiftdown-final-hook 'windmove-down)
;;(add-hook 'org-shiftright-final-hook 'windmove-right)

(setq org-support-shift-select 'always)

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package org-download
  :ensure t)

;;(use-package mixed-pitch
;;  :hook
;;  (text-mode . mixed-pitch-mode))
  
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

;; (font-lock-add-keywords
;;  'org-mode
;;  '(("^ *\\([-]\\) "
;;     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "???"))))))

(setq org-roam-directory (file-truename "~/org"))

(require 'ox-publish)

;; https://vincent.demeester.fr/posts/2020-03-22-org-mode-website.html
(setq org-publish-project-alist
      `(("pages"
         :recursive t
         :base-directory "~/org/jkossen.nl"
         :base-extension "org"
         :publishing-directory "~/jkossen.nl/public/"
         :publishing-function org-html-publish-to-html

	 :author "Jochem Kossen"
	 :email "jochem@jkossen.nl"

	 :auto-sitemap t            ;; create sitemap.org + .html
	 :sitemap-style list
	 :sitemap-sort-folders "first"
	 :sitemap-sort-files anti-chronologically
;;	 :sitemap-format-entry my/org-sitemap-date-entry-format
	 :sitemap-format-entry sbr/org-sitemap-format-entry
	 :sitemap-style list
	 :with-author nil           ;; Don't include author name
	 :with-creator t            ;; Include Emacs and Org versions in footer
         :with-toc nil                ;; Include a table of contents
         :section-numbers nil       ;; Don't include section numbers
	 :time-stamp-file nil
	 :with-author t
	 :headline-levels 4

	 :html-doctype "html5"

	 :html-html5-fancy t
	 :html-head-include-scripts nil
	 :html-head-include-default-style nil
	 :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"/>"
	 :html-preamble "
    <header>
      <h1><a href=\"https://jkossen.nl\">jkossen.nl</a></h1>
    </header>
"

	:html-postamble "
<hr/>
<footer>
  <div class=\"copyright-container\">
    <div class=\"copyright\">
      Copyright &copy; 2016-2022 Jochem Kossen some rights reserved<br/>
    </div>
  </div>

  <div class=\"generated\">
    Created with %c
    <div id=\"updated\">Updated: %C</div>
  </div>
</footer>")

        ("static"
         :base-directory "~/org/jkossen.nl"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png\\|svg"
         :recursive t
         :publishing-directory  "~/jkossen.nl/public/"
         :publishing-function org-publish-attachment)

        ("jkossen.nl" :components ("pages" "static"))))

(setq org-html-divs '((preamble "header" "top")
                      (content "main" "content")
                      (postamble "footer" "postamble"))
      org-html-container-element "section")

(defun pubkos ()
  "republish site, unmodified files included"
  (interactive)
  (org-publish "jkossen.nl" t))

(defun sbr/org-sitemap-format-entry (entry style project)
  "Format posts with author and published data in the index page.

ENTRY: file-name
STYLE:
PROJECT: `posts in this case."
  (cond ((not (directory-name-p entry))
         (format "%s ??? [[file:%s][%s]]
                 :PROPERTIES:
                 :PUBDATE: [%s]
                 :END:"
                 (format-time-string "%Y-%m-%d"
                                     (org-publish-find-date entry project))
                 entry
                 (org-publish-find-title entry project)
                 (format-time-string "%Y-%m-%d"
                                     (org-publish-find-date entry project))))
        ((eq style 'tree) (file-name-nondirectory (directory-file-name entry)))
        (t entry)))

(defun sbr/org-publish-sitemap (title list)
  ""
  (concat "#+TITLE: " title "\n\n"
          (org-list-to-subtree list)))

(defun my/org-sitemap-date-entry-format (entry style project)
  "Format ENTRY in org-publish PROJECT Sitemap format ENTRY ENTRY STYLE format that includes date."
  (let ((filename (org-publish-find-title entry project)))
    (if (= (length filename) 0)
        (format "*%s*" entry)
      (format "{{{timestamp(%s)}}} [[file:%s][%s]]"
              (format-time-string "%Y-%m-%d"
                                  (org-publish-find-date entry project))
              entry
              filename))))

(setq org-export-global-macros
      '(("timestamp" . "@@html:<span class=\"timestamp\">[$1]</span>@@")))

(setq org-image-actual-width '(300))
(setq-default line-spacing 4)

(defun reload-dotemacs ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el") )
