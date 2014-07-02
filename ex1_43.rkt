#lang racket


(define (square x)
  (* x x))

(define (compose f g)
  (lambda (arg) (f (g arg))))

;generate recursive process
(define (repeated f n)
  (if (> n 1)
      (compose f (repeated f (- n 1)))
      f))

((repeated square 2) 5)
;625
     