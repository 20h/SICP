#lang racket

;reducing to lowest terms 생략
(define (make-rat n d)
  (if (and (< n 0) (< d 0))
      (cons (- n) (- d))
      (cons n d)))

(make-rat -2 -4)
(make-rat 2 -4)
(make-rat -2 4)
(make-rat 2 4)
