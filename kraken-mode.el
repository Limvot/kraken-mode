;;;; kraken-mode.el --- Kraken language support for Emacs.
;; Nathan Braswell
;;
;; Author: Nathan Braswell <miloignis@gmail.com>
;; Maintainer: Nathan Braswell <miloignis@gmail.com>
;; Keywords: kraken
;; URL: https://github.com/Limvot/kraken-mode
;; Created: 20-02-2016
;; Version: 0.0

;; Commentary:
;;
;; Supplies hilighting and indenting for Kraken in Emacs

;;;; Code:
(defvar kraken-mode-hook nil)
(add-to-list 'auto-mode-alist '("\\.krak\\'" . kraken-mode))
(defvar kraken-mode-map (make-sparse-keymap)
  "Kraken-mode's keymap.")
(defvar kraken-mode-syntax-table
  (let ((kraken-mode-syntax-table (make-syntax-table)))
    (modify-syntax-entry ?/ ". 124b" kraken-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" kraken-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" kraken-mode-syntax-table)
    kraken-mode-syntax-table)
  "Syntax table for kraken-mode")
(defvar kraken-font-lock-keywords
  '(("fun \\(\\sw+\\)" (1 font-lock-function-name-face)))
  "Keyword highlighting specification for `kraken-mode'.")

(define-derived-mode kraken-mode fundamental-mode "Kraken"
  "Kraken mode is a major mode for editing Kraken files"
  :syntax-table kraken-mode-syntax-table
  (setq-local font-lock-defaults '(kraken-font-lock-keywords))
  (run-hooks 'kraken-mode-hook)
  )

(provide 'kraken-mode)

