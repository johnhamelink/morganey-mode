;;; morganey-mode.el --- Major mode for editing Morganey files -*- lexical-binding: t -*-

;; Copyright (C) 2016 Alexey Kutepov <reximkut@gmail.com>

;; Author: Alexey Kutepov <reximkut@gmail.com>
;; Maintainer: Alexey Kutepov <reximkut@gmail.com>
;; URL: https://github.com/morganey-lang/morganey-mode
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; Major mode for editing source files written in Morganey programming
;; language: https://github.com/morganey-lang/Morganey

;;; Code:

(defconst morganey--keywords
  (list (cons "load" font-lock-keyword-face)
        (cons ":=" font-lock-keyword-face)
        (cons "\\\\" font-lock-keyword-face)
        (cons "λ" font-lock-keyword-face)))

(defconst morganey--syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?/ ". 124" table)
    (modify-syntax-entry ?* ". 23b" table)
    (modify-syntax-entry ?\n ">" table)
    table))

(define-derived-mode morganey-mode prog-mode "Morganey"
  "Major mode for editing Morganey files"
  (set-syntax-table morganey--syntax-table)

  (setq font-lock-defaults '(morganey--keywords))
  (make-local-variable 'comment-start)
  (setq comment-start "// ")
  (make-local-variable 'comment-end)
  (setq comment-end "")
  (make-local-variable 'comment-start-skip)
  (setq comment-start-skip "//[ \t]*")
  (make-local-variable 'comment-column)
  (setq comment-column 0)
  (define-key morganey-mode-map
    (kbd "C-\\")
    (lambda () (interactive) (insert "λ"))
  ))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.mgn\\'" . morganey-mode))

(provide 'morganey-mode)

;;; morganey-mode.el ends here
