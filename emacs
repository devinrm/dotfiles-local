;; much organization needed

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

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
                          'helm
                          'evil
                          'evil-leader
                          'evil-indent-textobject
                          'evil-visualstar
                          'evil-exchange
                          'evil-surround
                          'evil-matchit
                          'evil-nerd-commenter
                          'evil-search-highlight-persist
                          'evil-numbers
                          'evil-args
                          'evil-mark-replace
                          'powerline-evil
                          'relative-line-numbers
                          'jbeans-theme
                          'fill-column-indicator
                          'rainbow-delimiters
                          'auto-complete
                          'ag
                          'robe
                          'dtrt-indent
                          'enh-ruby-mode
                          'diminish
                          'highlight-indentation
                          'web-mode
                          'multiple-cursors
                          'smooth-scrolling
                          'autopair
                          'key-chord)

(require 'evil-indent-textobject)
(require 'evil-visualstar)
(require 'evil-exchange)
(require 'evil-surround)
(require 'evil-matchit)
(require 'evil-nerd-commenter)
(require 'evil-search-highlight-persist)
(require 'evil-numbers)
(require 'evil-args)
(require 'evil-mark-replace)

(require 'autopair)
(autopair-global-mode)

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

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

(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "p" 'projectile-find-file
  "b" 'projectile-switch-to-buffer
  "w" 'evil-write
  "r" 'ansi-term)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(global-relative-line-numbers-mode)
(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

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

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

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
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(define-key evil-normal-state-map (kbd "C-u") (lambda ()
						(interactive)
						(evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-d") (lambda ()
						(interactive)
						(evil-scroll-down nil)))

(setq-default tab-width 2 indent-tabs-mode nil)

(dtrt-indent-mode 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

(show-paren-mode t)

(setq make-backup-files nil)

(setq evil-move-cursor-back nil)

(scroll-bar-mode -1)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'diminish)
(diminish 'visual-line-mode)
