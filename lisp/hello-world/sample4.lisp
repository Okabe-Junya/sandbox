;; -*- mode: Lisp; Syntax: Common-Lisp; -*-

; ~a は引数を文字列に変換して埋め込む
(format t "Hello, ~a!~%" "Lisp") ; Hello, Lisp!

; 数値でも文字列に変換して埋め込む
(format t "The value is ~a~%" 42) ; The value is 42

; ~s は引数を Lisp の構文で埋め込む
(format t "The list is ~s~%" '(1 2 3)) ; The list is (1 2 3)

; ~% は改行を挿入する
(format t "Line 1~%Line 2~%")
; Line 1
; Line 2

; ~& は改行を挿入し、次の行をインデントする
(format t "Indented~&Line~%")
; Indented
;   Line

; ~10,~5,~3 はフィールド幅を指定する
(format t "The number is ~10d~%" 42) ; The number is         42
