#lang racket

;golden ratio x는 정의에 의해 x^2 = x + 1 인데,
;양변을 x로 나누면(golden ratio는 양수라고 가정함)
;x = 1 + 1/x 가 된다.
;따라서 f(x) = 1 + 1/x 인 경우의 fixed point를 찾는 문제와 같다.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
