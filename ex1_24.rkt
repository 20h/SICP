#lang racket

(define (square a)
	(* a a))

(define (divides? a b)
  (= (remainder b a) 0))


(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((fast-prime? n 100000)
           (display n)
           (report-time (- (current-milliseconds) start-time)))))

(define (report-time elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (display " ms")
  (newline))

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
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))




;search all primes X between range n1 <= X <= n2)
;(only check odd numbers)
(define (search-for-primes n1 n2)
 (cond ((> n1 n2) (display "test ended..") (newline) )
       ((even? n1) (search-for-primes (+ n1 1) n2))
       (else 
        (timed-prime-test n1)
        (search-for-primes (+ n1 2) n2))))


(search-for-primes 1000        1019)       ; 1009, 1013, 1019
(search-for-primes 10000       10037)      ; 10007, 10009, 10037
(search-for-primes 100000      100043)     ; 100003, 100019, 100043
(search-for-primes 1000000     1000037)    ; 1000003, 1000033, 1000037
(search-for-primes 10000000    10000103)   ; 10000019, 10000079, 10000103
(search-for-primes 100000000   100000039)  ; 100000007, 100000037, 100000039,
(search-for-primes 1000000000  1000000021) ; 1000000007, 1000000009, 1000000021,


;1009 *** 501 ms
;1013 *** 533 ms
;1019 *** 552 ms
;test ended..
;10007 *** 636 ms
;10009 *** 625 ms
;10037 *** 623 ms
;test ended..
;100003 *** 735 ms
;100019 *** 754 ms
;100043 *** 759 ms
;test ended..
;1000003 *** 846 ms
;1000033 *** 831 ms
;1000037 *** 868 ms
;test ended..
;10000019 *** 1022 ms
;10000079 *** 1088 ms
;10000103 *** 1091 ms
;test ended..
;100000007 *** 1233 ms
;100000037 *** 1238 ms
;100000039 *** 1271 ms
;test ended..
;1000000007 *** 1366 ms
;1000000009 *** 1346 ms
;1000000021 *** 1369 ms
;test ended..

;10000의 자리수와 100000000(10000*10000)의 자리수를 비교하면 약 두배의 시간이 걸리는 것을 알 수 있다.
;n이 제곱으로 증가할 때 2배의 크기로 늘어나는 log의 성질에 부합한다.


