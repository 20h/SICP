#lang racket

(define (double f)
  (lambda (arg) (f (f arg))))

(define (inc x)
  (+ x 1))

;(((double (double double)) inc) 5)

((double inc) 5) ; +2 (1번 더하는 것을 1번)

(((double double) inc) 5) ; +4 (2번 더하는 것을 2번)

(((double (double double)) inc) 5) ; +16 (네번 더하는 것을 4번)

(((double (double (double double))) inc) 5) ; +256 (16번 더하는 것을 16번)
