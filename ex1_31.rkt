#lang racket

(define (identity n) n)
(define (inc n) (+ n 1))


(define (product term a next b)      ; generate recursive process
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b) ; generate iterative process
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
      
  (iter a 1))




;factorial using product

(define (factorial n)
  (product identity 1 inc n))

(define (factorial-iter n)
  (product identity 1 inc n))

(factorial      5) ; 120
(factorial-iter 5) ; 120



;pi using product

(define (piterm n) (/ (* (- n 1) (+ n 1))
                      (* n n)))

(define (add2 n) (+ n 2))

(define (pi n) ; assume n >= 3
  (* (product piterm 3 add2 n)
     4))

(define (pi-iter n) ; assume n >= 3
  (* (product-iter piterm 3 add2 n)
     4))


(pi      10000) ; 3.1417497371492671833019350...
(pi-iter 10000) ; 3.1417497371492671833019350...





