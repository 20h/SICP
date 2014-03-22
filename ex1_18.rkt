#lang racket

(define (double a) (* 2 a))
(define (halve a) (/ a 2))    ;(even) integer를 2로 나눈다. 문제 정의상, a가 odd일 경우 operation은 undefined.
(define (even? a) (= 0 (remainder a 2)))

(define (multi a b)
  (multi-iter a b 0))

(define (multi-iter a b c) ; (a*b)+c 를 step transition 간 동일한 값으로 유지. b가 0이 되었을때 c를 취한다.
  (cond ((= b 0) c)
        ((even? b) (multi-iter (double a) (halve b) c       ))
        (else      (multi-iter  a         (- b 1)   (+ c a) ))
  ))

(multi 0 0)
(multi 7 0)
(multi 0 7)
(multi 7 7)
