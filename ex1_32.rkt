#lang racket

(define (identity n) n)
(define (inc n) (+ n 1))

;recursive accumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;iterative accumulate
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))

  (iter a null-value))
              
;recursive sum / product
(define (sum-by-accumulate term a next b)
  (accumulate + 0 term a next b))

(define (product-by-accumulate term a next b)
  (accumulate * 1 term a next b))

;iterative sum / product
(define (sum-by-accumulate-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-by-accumulate-iter term a next b)
  (accumulate-iter * 1 term a next b))


(sum-by-accumulate           identity 1 inc 10) ;55
(product-by-accumulate       identity 1 inc 10) ;3628800

(sum-by-accumulate-iter      identity 1 inc 10) ;55
(product-by-accumulate-iter  identity 1 inc 10) ;3628800