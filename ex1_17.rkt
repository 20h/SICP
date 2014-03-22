#lang racket

(define (double a) (* 2 a))
(define (halve a) (/ a 2))
(define (even? a) (= 0 (remainder a 2)))

(define (multi a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) a)
        ((even? b) (multi (double a) (halve b)))
        (else (+ a (multi a (- b 1))))
  ))

(multi 1000 1001)