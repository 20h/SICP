#lang racket

(define (square n) (* n n))

(define (f g)
  (g 2))

(f square) ; 2*2

(f (lambda (z) (* z (+ z 1)))) ; 2*3 = 6

(f f) ;(f 2)로 expand되고, (f 2)는 다시 (2 2)로 expand된다. 2가 2를 argument를 받을 수 있는 procedure가 아니므로 error를 낸다.(not a procedure)
