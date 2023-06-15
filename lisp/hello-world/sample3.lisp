;; -*- mode: Lisp; Syntax: Common-Lisp; -*-

;; 簡単な算術演算
(+ 2 3) ; 2 + 3
(- 3 2) ; 3 - 2
(* 2 3) ; 2 * 3
(/ 4 2) ; 4 / 2
(rem 5 2) ; 5 % 2

;; 算術演算の結果を適当な変数に代入して出力する
(defvar a)
(setq a (+ 2 3))
(format t "2 + 3 = ~d~%" a)

(setq a (- 3 2))
(format t "3 - 2 = ~d~%" a)

(setq a (* 2 3))
(format t "2 * 3 = ~d~%" a)

(setq a (/ 4 2))
(format t "4 / 2 = ~d~%" a)

(setq a (rem 5 2))
(format t "5 % 2 = ~d~%" a)

;; 商や余りを求める
(floor 5 2)
(ceiling 5 2)
(truncate 5 2)
(round 5 2)

;; 変数に値を代入して出力する
(multiple-value-bind (a b) (floor 5 2)
    (format t "floor(5 / 2) = ~d, 余り: ~d~%" a b))

(multiple-value-bind (a b) (ceiling 5 2)
    (format t "ceiling(5 / 2) = ~d, 余り: ~d~%" a b))

(multiple-value-bind (a b) (truncate 5 2)
    (format t "truncate(5 / 2) = ~d, 余り: ~d~%" a b))

(multiple-value-bind (a b) (round 5 2)
    (format t "round(5 / 2) = ~d, 余り: ~d~%" a b))


; 簡単なユニットテスト
(assert (= (+ 2 3) 5))
(assert (= (- 3 2) 1))
(assert (= (* 2 3) 6))
(assert (= (/ 4 2) 2))
(assert (= (rem 5 2) 1))

(assert (= (floor 5 2) 2))
(assert (= (ceiling 5 2) 3))
(assert (= (truncate 5 2) 2))
(assert (= (round 5 2) 2))

(format t "All tests passed~%")
