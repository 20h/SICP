#lang racket

(define (square a)
	(* a a))

;fermat test
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
;   (display a) (newline)
    (cond ((and (< a n) (> a 0)) (and (= (expmod a n n) a) (try-it (- a 1))))
          (else true)))
  (try-it (- n 1)) ; n-1부터 1까지 순차적으로 test한다.
)


;prime numbers
(fermat-test 7)     ; true
(fermat-test 13)    ; true


;Carmichael numbers : 561, 1105, 1729, 2465, 2821, 6601 (prime number가 아님)
(fermat-test 561)   ; true
(fermat-test 1105)  ; true
(fermat-test 1729)  ; true
(fermat-test 2465)  ; true
(fermat-test 2821)  ; true
(fermat-test 6601)  ; true
; this numbers really do fool the Fermat test.
