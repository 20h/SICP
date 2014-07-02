#lang racket

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

(define (iterative-improve good-test? improve)
  (lambda (guess) 
    (define (iter g)
       (if (good-test? g)
           g
           (iter (improve g))))
    (iter guess)))

;new sqrt
(define (sqrt x)
  (define tolerance 0.000001)
  (define (good-enough? guess)        ;good-test
    (< (abs (- (square guess) x)) tolerance))
  (define (improve-by-average guess)  ;improve
    (average guess (/ x guess)))
  
  ((iterative-improve good-enough? improve-by-average) 1.0))

;new fixed-point
(define (fixed-point f first-guess)
  (define tolerance 0.000000001)
  (define (close-enough? guess)        ;good-test
    (< (abs (- (f guess) guess)) tolerance))
  
  ((iterative-improve close-enough? f) 1.0))

(sqrt 81.0) ; 9.000000000007091

(fixed-point cos 1.0) ; 0.7390851327392538
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0) ;1.2587281780182893


