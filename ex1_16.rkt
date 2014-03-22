#lang racket

(define (even? n)
  (= (remainder n 2) 0))



;;;; iterative process
(define (expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((< n 1)   a)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
        (else      (fast-expt-iter b (- n 1) (* a b)))
  )
)


;;;; recursive process
(define (square x) (* x x))

(define (fast-expt-recu b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-recu b (/ n 2))))
        (else (* b (fast-expt-recu b (- n 1))))))


(expt 2 10)
;(fast-expt-recu 2 100000)
