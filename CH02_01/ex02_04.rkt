#lang racket

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;substitution model을 사용하여 verify 해볼 수 있다.
 (car (cons 1 2))
;(car (lambda (m) (m 1 2)))
;((lambda (m) (m 1 2)) (lambda (p q) p))
;((lambda (p q) p) 1 2)
;1

(define (cdr z)
  (z (lambda (p q) q)))

;cdr도 마찬가지로 substitution model을 사용하여 verify 해보자.
 (cdr (cons 1 2))
;(cdr (lambda (m) (m 1 2)))
;((lambda (m) (m 1 2)) (lambda (p q) q))
;((lambda (p q) q) 1 2)
;2
