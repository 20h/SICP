#lang racket

(define tolerance 0.00001)

;get '1/golden ratio' by using finding fixed-point
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(/ 1 (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))


;ver 1. generate recursive process
(define (cont-frac n d k)
  (define (cont-frac-recursive i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-recursive (+ i 1))))))
  (cont-frac-recursive 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

;ver 2. generate iterative process
(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (< k 1)
      result
      (iter (- k 1) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)

;k>10 부터 소수점 이하 4자리 수준의 정확도를 얻을 수 있다.


;result
;0.6180344478216819
;0.6180555555555556 (recursive ver. k=11)
;0.6180555555555556 (iterative ver. k=11)
      
