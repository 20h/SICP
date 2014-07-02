#lang racket

;constructor
(define (make-interval a b) (cons a b))

;selectors
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


(lower-bound (make-interval 3 4)) ; 3
(upper-bound (make-interval 3 4)) ; 4
