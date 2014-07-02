#lang racket

;constructor
(define (make-interval a b) (cons a b))

;selectors
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))




(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(sub-interval (make-interval 1 5) (make-interval 2 3))

                    