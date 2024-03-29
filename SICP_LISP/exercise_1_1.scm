#lang planet neil/sicp

;; P13 - [练习 1.1]

10;

(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))

(define a 3)
(define b (+ a 1))

(+ a b (* a b))
(= a b)

(if (and (> b a) (< (* a b)))
  b
  a)

; 16
(cond ((= a 4) 6)
  ((= b 4) (+ 6 7 a))
  (else 25))

(+ 2 (if (> b a) b a))

; 16
(* (cond ((> a b) a)
  ((< a b) b)
  (else -1))
  (+ a 1))