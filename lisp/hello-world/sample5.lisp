;; -*- mode: Lisp; Syntax: Common-Lisp; -*-

; 簡単な条件分岐
(defun foo (x)
    (if (> x 0)
        (format t "Positive~%"))
    (if (< x 0)
        (format t "Negative~%"))
    (if (zerop x)
        (format t "Zero~%")))

(foo 1)
(foo -1)
(foo 0)

; 簡単な条件分岐2
(defun bar(x)
    (cond ((> x 0) (format t "Positive~%"))
        ((< x 0) (format t "Negative~%"))
        ((zerop x) (format t "Zero~%"))))

(bar 1)
(bar -1)
(bar 0)

; 繰り返し
(defun baz (x)
    (loop for i from 0 to x
        do (format t "i = ~d~%" i)))

(baz 10)

; 繰り返し2
(defun qux (x)
    (dotimes (j x)
        (format t "j = ~d~%" j)))

(qux 10)

; 繰り返し3
(defun quux ()
    (dolist (k (list 0 1 2 3 4 5 6 7 8 9 10))
        (format t "k = ~d~%" k)))

(quux)
