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
			  'fiplr
			  'relative-line-numbers
			  'jbeans-theme
			  'fill-column-indicator
			  'key-chord)
                                   

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
"b" 'switch-to-buffer
"r" 'ansi-term)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(global-relative-line-numbers-mode)

(global-set-key (kbd "C-a") 'save-buffer)
(global-set-key (kbd "C-c") 'kill-buffer)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "ii" 'evil-normal-state)
(key-chord-mode 1)

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
