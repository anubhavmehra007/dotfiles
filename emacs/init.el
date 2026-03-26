;; Suppress native-comp warnings (treesit, python, etc.)
(setq native-comp-async-report-warnings-errors 'silent)

;; Package setup
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu"   . "https://elpa.nongnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Ensure packages are installed
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))
(unless (package-installed-p 'catppuccin-theme)
  (package-install 'catppuccin-theme))
(unless (package-installed-p 'agent-shell)
  (package-install 'agent-shell))
(unless (package-installed-p 'expand-region)
  (package-install 'expand-region))

;; UI tweaks
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(require 'recentf)
(recentf-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(column-number-mode 1)
(setq use-dialog-box nil)

;; Font
(set-face-attribute 'default nil
                    :family "IBM Plex Mono"
                    :height 160)


;; Theme (Catppuccin)
(require 'catppuccin-theme)
(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t)

;; Fill column
(setq-default fill-column 120)
(global-display-fill-column-indicator-mode)
(set-face-attribute 'fill-column-indicator nil 
                    :foreground (face-attribute 'shadow :foreground)
                    :slant 'normal
                    :weight 'normal)

;; Tabs & indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; PDF tools (safe load)
(when (package-installed-p 'pdf-tools)
  (pdf-loader-install))

;; simpc-mode setup
(add-to-list 'load-path (expand-file-name "~/.config/emacs/"))
(when (file-exists-p (expand-file-name "~/.config/emacs/simpc-mode.el"))
  (require 'simpc-mode)
  (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode)))


;; Multiple cursors
  (require 'multiple-cursors)
  (global-set-key (kbd "C-M-j") 'mc/mark-all-dwim) ; both marked and unmarked region. multiple presses.
  (global-set-key (kbd "C-M-c") 'mc/edit-lines)
  (global-set-key (kbd "C-M-l") 'er/expand-region) ; only type once, then l, -, 0
  (global-set-key (kbd "C-M-/") 'mc/mark-all-like-this) ; select text first. finds all occurrences.
  (global-set-key (kbd "C-M-,") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-M-.") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-M-<") 'mc/skip-to-previous-like-this)
  (global-set-key (kbd "C-M->") 'mc/skip-to-next-like-this)
  (with-eval-after-load 'multiple-cursors
    (define-key mc/keymap (kbd "<return>") nil))

;; Buffer display behavior
(setq display-buffer-base-action
      '((display-buffer-reuse-window
         display-buffer-reuse-mode-window
         display-buffer-same-window
         display-buffer-in-previous-window)))

;;Encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(set-terminal-coding-system 'utf-8-unix)

;; Claude Code Integration in Emacs.
;; (add-to-list 'exec-path "/home/anubhav/.local/share/nvm/v24.13.0/bin/")
;; (require 'acp)
;; (require 'agent-shell)
;; (require 'agent-shell-anthropic)
;; (setq agent-shell--available-agents nil)
;; (setq agent-shell-anthropic-claude-environment 
;;       (agent-shell-make-environment-variables :inherit-env t))
;; (setq agent-shell-anthropic-authentication
;;       (agent-shell-anthropic-make-authentication :login t))

;; Formatting style is in .emacs like the rest of the custom variables
;; Formatting simpc
(when (and (executable-find "clang-format")
           (require 'clang-format nil 'noerror)
           )
    (add-hook 'simpc-mode-hook
              (lambda ()
                (add-hook 'before-save-hook #'clang-format-buffer nil t))))
