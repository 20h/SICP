#lang racket

(define tolerance 0.000000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (arg) (f (g arg))))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (repeated f n)
  (if (> n 1)
      (compose f (repeated f (- n 1)))
      f))

(define (log2 n) (/ (log n) (log 2)))

(define (Nth-root x N)
  (fixed-point ((repeated average-damp (floor (log2 N))) (lambda (y) (/ x (Nth-square y (- N 1))))) 10.0)
)

(define (Nth-square x N)
  (if (> N 0)
      (* x (Nth-square x (- N 1)))
      1))

;Nth root를 fixed-point finding방식으로 찾을 때 필요한 average-damping 최소 적용 횟수는 floor(log2 N)이다.
;(실험적으로 알아낼 수 있었음. 사실은.. 확실하지 않아서 구글에서 솔루션을 검색해봤음..)
;(나중에 증명해보자.)

(Nth-root 256 8) ; 3
(Nth-root 243 5) ; 3
(Nth-root 1024 10) ; 2
(Nth-root 10000 2) ; 100

