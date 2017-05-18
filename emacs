;; much organization needed

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
  Return a list of installed packages or nil for every skipped package."
  (mapcar
    (lambda (package)
      (if (package-installed-p package)
        nil
        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
          (package-install package)
          package)))
    packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'iedit
                          'magit
                          'projectile
                          'js2-mode
                          'helm
                          'tern
                          'relative-line-numbers
                          'jbeans-theme
                          'fill-column-indicator
                          'rainbow-delimiters
                          'auto-complete
                          'helm-ag
                          'robe
                          'sass-mode
                          'scss-mode
                          'fiplr
                          'dtrt-indent
                          'enh-ruby-mode
                          'diminish
                          'highlight-indentation
                          'web-mode
                          'multiple-cursors
                          'smooth-scrolling
                          'auto-complete
                          'tern-auto-complete
                          'autopair
                          'key-chord)

(require 'autopair)
(autopair-global-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'multiple-cursors)

(require 'highlight-indentation)
 (add-hook 'enh-ruby-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))

 (add-hook 'coffee-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

(setq scroll-margin 5
scroll-conservatively 9999
    scroll-step 1)

(setq redisplay-dont-pause t)

(set-display-table-slot standard-display-table 'wrap ?\ )

(set-default 'truncate-lines t)

(global-visual-line-mode t)

(setq longlines-wrap-follows-window-size t)
(global-set-key [(control meta l)] 'longlines-mode)

(load-theme 'jbeans t)

(require 'fill-column-indicator)

(defun sanityinc/fci-enabled-p () (symbol-value 'fci-mode))

(defvar sanityinc/fci-mode-suppressed nil)
(make-variable-buffer-local 'sanityinc/fci-mode-suppressed)

(defadvice popup-create (before suppress-fci-mode activate)
           "Suspend fci-mode while popups are visible"
           (let ((fci-enabled (sanityinc/fci-enabled-p)))
             (when fci-enabled
               (setq sanityinc/fci-mode-suppressed fci-enabled)
               (turn-off-fci-mode))))

(defadvice popup-delete (after restore-fci-mode activate)
           "Restore fci-mode when all popups have closed"
           (when (and sanityinc/fci-mode-suppressed
                      (null popup-instances))
             (setq sanityinc/fci-mode-suppressed nil)
             (turn-on-fci-mode)))

;; esc quits
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
	(setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(setq tab-width 2)

(dtrt-indent-mode 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

(show-paren-mode t)

(setq make-backup-files nil)

(scroll-bar-mode -1)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'diminish)
(diminish 'visual-line-mode)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
  '(progn
    (require 'tern-auto-complete)
    (tern-ac-setup)))
