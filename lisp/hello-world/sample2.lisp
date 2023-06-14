;; -*- mode: Lisp; Syntax: Common-Lisp; -*-

;; 簡単な関数を定義する
(defun hello (text)
    (format t "Hello, ~d~%" text)
)

;; 関数を呼び出す
(hello "World")
;=> Hello, World

;; 関数を変数に束縛する
(defvar hello-var #'hello)

;; 束縛された関数を呼び出す
(funcall hello-var "Lisp")
;=> Hello, Lisp
