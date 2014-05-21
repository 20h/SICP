#lang racket

(define (cube x)
  (* x x x))



(define (integral2 f a b n)
  (define h
    (/ (- b a) n))

  (define (y k)
    (f (+ a (* k h))))

  (define (sum term first next last)
    (if (> first last)
      0
      (+ (term first)
         (sum term (next first) next last))))

  (define (simpsonTerm i) ;0, 1, 2, ,,,n-1, n
    (* (y i)
       (cond ((= i 0) 1)
             ((= i n) 1)
             ((= 1 (remainder i 2)) 4)
             (else 2))))
  
  (define (inc n) (+ n 1))
  
  (* (/ h 3)
     (sum simpsonTerm 0 inc n))) ; from 0 to n, accumulate simpson terms

(integral2 cube 0 5 100)

(integral2 cube 0 5 1000)
  