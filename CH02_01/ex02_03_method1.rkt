#lang racket

;constructor
(define (make-point x y)
  (cons x y))

;selectors
(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

;abstraction barrier ver.1
;constructor
(define (make-rectangle-v1 topleft bottomright)
  (cons topleft bottomright))

;selectors
(define (topleft-rectangle rectangle)
  (car rectangle))

(define (bottomright-rectangle rectangle)
  (cdr rectangle))

(define (width-rectangle rectangle)
  (- (x-point (bottomright-rectangle rectangle))
     (x-point (topleft-rectangle rectangle))))

(define (height-rectangle rectangle)
  (- (y-point (bottomright-rectangle rectangle))
     (y-point (topleft-rectangle rectangle))))


;여러가지 계산 using barrier above
;- 둘레
(define (perimeter rectangle)
  (+ (* 2 (width-rectangle rectangle))
     (* 2 (height-rectangle rectangle))))
  
;- 넓이
(define (area rectangle)
  (* (width-rectangle rectangle)
     (height-rectangle rectangle)))

(perimeter (make-rectangle-v1 (make-point 1 1) (make-point 3 5))) ; 12
(area (make-rectangle-v1 (make-point 1 1) (make-point 3 5))) ; 8

