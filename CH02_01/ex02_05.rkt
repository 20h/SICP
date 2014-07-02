#lang racket

(define (cons a b)
  (define (nsquare x n)
    (if (= n 0)
        1
        (if (> n 0)
            (* x (nsquare x (- n 1)))
            x)))
           
  (* (nsquare 2 a)
     (nsquare 3 b)))

(define (car x) ; x is a pair that has value 2^a * 3^b
  (define (count-2s n)
    (if (= 0 (remainder n 2))
        (+ 1 (count-2s (/ n 2)))
        0))
  (count-2s x)
)

(define (cdr x) ; x is a pair that has value 2^a * 3^b
  (define (count-3s n)
    (if (= 0 (remainder n 3))
        (+ 1 (count-3s (/ n 3)))
        0))
  (count-3s x)
)

(car (cons 2 3))     ; 2
(cdr (cons 2 3))     ; 3

(car 108) ; 2
(cdr 108) ; 3
