#lang racket

;church numerals가 뭔지부터 알아야 함.
;간단히..
;0f(x) = x
;1f(x) = f(x)
;2f(x) = f(f(x))
;3f(x) = f(f(f(x)))
;와 같은 자연수의 표현을 말함.

;wiki
;Church numerals are the representations of natural numbers under Church encoding
;The higher-order function that represents natural number n is a function that maps any function f to its n-fold composition
;각 자연수n를 표한하는 function(higher-order)는 어떤 함수 f를 n번 적용(?)한 함수이다.
;In simpler terms, the "value" of the numeral is equivalent to the number of times the function encapsulates its argument.

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))
;즉, 이것은 1을 표현한 function이다. (0에서 1더한 것이므로)
;이것이 'one'임. two도 (add-1 one)를 substitution 해보면 어떤 함수인지 알 수 있음.

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;definition of '+'
(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define (inc1 n)
  (+ 1 n))

(define (double n)
  (* 2 n))

(((plus one two) inc1) 10) ; 13
(((plus two one) double) 10) ; 80

