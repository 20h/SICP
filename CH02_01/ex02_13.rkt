#lang racket

;두 interval (IA * IB)의 결과는
;P(Product) = (Center IA) * (Center IB)라고 했을 때
;AT(Average Tolerance) = (small Tolerance IA) + (small Tolerance IB)
;(make-center-percent P AT) 로 근사할 수 있다.

;작은 tolerance일 경우 얼추 비슷하다.


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


(make-center-percent 1000 2) ; IA:(990, 1010)
(make-center-percent 50 3)   ; IB:(49.25, 50.75)
;IA * IB = (48757.5, 51257.5)

;my approximation
(make-center-percent (* 1000 50) (+ 2 3))
;(48750, 51250)



