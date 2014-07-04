#lang racket

;constructor
(define (make-interval a b) (cons a b))

;selectors
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


(define (make-center-percent center tolerance)
  (let ((a (* center (/ (- 100 (/ tolerance 2)) 100)))
        (b (* center (/ (+ 100 (/ tolerance 2)) 100))))
  (make-interval a b)))

(define (percent i)
  (let ((diff (- (upper-bound i) (lower-bound i))))
       (* (/ diff (center i)) 100)))
  
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
  
(make-center-percent 360 10) ; 342, 378

(center  (make-center-percent 360 10)) 360
(percent (make-center-percent 360 10)) 10
