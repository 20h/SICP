#lang racket

;constructor
(define (make-point x y)
  (cons x y))

;selectors
(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))


;abstraction barrier ver.2
;constructor
(define (make-rectangle-v2 topcenter leftcenter)
  (cons topcenter leftcenter))

;selectors
(define (topcenter-rectangle rectangle)
  (car rectangle))

(define (leftcenter-rectangle rectangle)
  (cdr rectangle))

(define (width-rectangle rectangle)
  (* 2 (- (x-point (topcenter-rectangle rectangle))
          (x-point (leftcenter-rectangle rectangle)))))

(define (height-rectangle rectangle)
  (* 2 (- (y-point (leftcenter-rectangle rectangle))
          (y-point (topcenter-rectangle rectangle)))))


;여러가지 계산 using barrier above
;- 둘레
(define (perimeter rectangle)
  (+ (* 2 (width-rectangle rectangle))
     (* 2 (height-rectangle rectangle))))
  
;- 넓이
(define (area rectangle)
  (* (width-rectangle rectangle)
     (height-rectangle rectangle)))

(perimeter (make-rectangle-v2 (make-point 2 1) (make-point 1 3))) ; 12
(area (make-rectangle-v2 (make-point 2 1) (make-point 1 3))) ; 8

