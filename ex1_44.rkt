#lang racket


(define (square x)
  (* x x))

(define (compose f g)
  (lambda (arg) (f (g arg))))

;generate recursive process
(define (repeated f n)
  (if (> n 1)
      (compose f (repeated f (- n 1)))
      f))

(define dx 0.001)

;return smoother f
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smoothed-func f n)
  ((repeated smooth n) f))


((n-fold-smoothed-func square 1) 3)
((n-fold-smoothed-func square 2) 3)
((n-fold-smoothed-func square 3) 3)
((n-fold-smoothed-func square 4) 3)
((n-fold-smoothed-func square 5) 3)
((n-fold-smoothed-func square 6) 3)
((n-fold-smoothed-func square 7) 3)
((n-fold-smoothed-func square 8) 3)
((n-fold-smoothed-func square 9) 3)
;n이 커질수록 부정확함
