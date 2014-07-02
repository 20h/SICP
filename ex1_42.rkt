#lang racket

(define (compose f g)
  (lambda (arg) (f (g arg))))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

((compose square inc) 6)
;49
