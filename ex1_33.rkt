#lang racket

(define (identity n) n)
(define (inc n) (+ n 1))

(define (square a)
	(* a a))

;prime
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n) ;filter procesure
  (= n (smallest-divisor n)))

;filtered accumulate
(define (filtered-accumulate combiner filter null-value term a next b)
  (if (> a b)
      null-value
      (combiner (cond ((filter a) (term a))
                      (else null-value))
                (filtered-accumulate combiner filter null-value term (next a) next b))))

;recursive sum / product
(define (sum-square-by-filtered-accumulate a b)
  (filtered-accumulate + prime? 0 square a inc b))

(define (product-LessThanN-by-accumulate-filter N)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  
  (define (relatively-prime-lessThanN? i) ;filter procedure
    (cond ((and (< i N) (= (gcd i N) 1)) true)
          (else false)))
  (filtered-accumulate * relatively-prime-lessThanN? 1 identity 1 inc N))


(sum-square-by-filtered-accumulate 1 10)    ;2*2 + 3*3 + 5*5 + 7*7 = 88

(product-LessThanN-by-accumulate-filter 10) ;3*7*9 = 189