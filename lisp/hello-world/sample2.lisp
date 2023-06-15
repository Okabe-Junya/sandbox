;; -*- mode: Lisp; Syntax: Common-Lisp; -*-

;; 簡単な関数を定義する
(defun hello (name)
    (concatenate 'string "Hello, " name))


;; 関数を呼び出す
(format t "~A~%" (hello "World"))
;=> Hello, World

;; 関数を変数に束縛する
(defvar hello-var #'hello)

;; 束縛された関数を呼び出す
(format t "~A~%" (funcall hello-var "Lisp"))
;=> Hello, Lisp


; 簡単なユニットテスト
(assert (equal (hello "World") "Hello, World"))
(assert (equal (funcall hello-var "Lisp") "Hello, Lisp"))
(format t "All tests passed~%")
