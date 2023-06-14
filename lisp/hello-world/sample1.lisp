;; -*- mode: Lisp; Syntax: Common-Lisp; -*-

;; グローバル変数の定義
(defvar x 10)
(format t "x = ~d~%" x)

;; ローカル変数の定義
(let ((y 20))
    (format t "y = ~d~%" y)
    (format t "x = ~d~%" x)
)
