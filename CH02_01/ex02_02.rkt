#lang racket

;constructor
(define (make-point x y)
  (cons x y))

;selectors
(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))


;constructor
(define (make-segment start end)
  (cons start end))

;selectors
(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment line) ; use data abstraction barrier
  (make-point 
     (/ (+ (x-point (start-segment line))
           (x-point (end-segment line))) 2)
     (/ (+ (y-point (start-segment line))
           (y-point (end-segment line))) 2)))

(print-point (midpoint-segment (make-segment (make-point 1 1) (make-point 5 5))))
;(3,3)

(print-point (midpoint-segment (make-segment (make-point -3 -2) (make-point 5 6))))
;(1,2)
