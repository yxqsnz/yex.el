;;; yex-mode.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 yxqsnz
;;
;; Author: yxqsnz <yxqsnz@gmail.com>
;; Maintainer: yxqsnz <yxqsnz@gmail.com>
;; Created: março 30, 2022
;; Modified: março 30, 2022
;; Version: 0.0.1
;; Keywords: extensions
;; Homepage: https://github.com/yxqsnz/yex.el
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defconst yex-mode-syntax-table
  (with-syntax-table (copy-syntax-table)
    ;; C/C++ style comments
        (modify-syntax-entry ?/ ". 124b")
        (modify-syntax-entry ?* ". 23")
        (modify-syntax-entry ?\n "> b")
    ;; Chars are the same as strings
    (modify-syntax-entry ?' "\"")
    (syntax-table))
  "Syntax table for `yex-mode'.")


(eval-and-compile
  (defconst yex-keywords
    '(
      "def"
      "become"
      "let"
      "in"
      "if" "else"
      "new"
      "this"
      "type"
      "typeof"
      "end")))
(eval-and-compile
  (defconst yex-builtins
    '(
      "true"
      "false"
      "nil")))
(defconst yex-highlights
  `(
    (":[a-z0-9A-Z]*"  . font-lock-constant-face)
    ("[A-Z][A-z-0-9-_]*" . font-lock-constant-face)
    (,(regexp-opt yex-builtins 'symbols) . font-lock-builtin-face)
    (,(regexp-opt yex-keywords 'symbols) . font-lock-keyword-face)))

;;;###autoload
(define-derived-mode yex-mode prog-mode "yex"
  "Major Mode for editing Yex source code."
  (setq font-lock-defaults '(yex-highlights))
  (set-syntax-table yex-mode-syntax-table))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.yex\\'" . yex-mode))


(provide 'yex-mode)
;;; yex-mode.el ends here
