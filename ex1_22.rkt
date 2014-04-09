#lang racket


(define (square a)
	(* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (looped-prime? n count) ; loop version
  (cond ((> count 0) (and (= n (smallest-divisor n)) (looped-prime? n (- count 1))  ))
        (else (= n (smallest-divisor n)))))

(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((looped-prime? n 1000)
           (display n)
           (report-time (- (current-milliseconds) start-time)))))

(define (report-time elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (display " ms")
  (newline))


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




;;result
;1009 *** 8 ms
;1013 *** 8 ms
;1019 *** 7 ms             avg : 7.67 ms
;test ended..
;10007 *** 36 ms
;10009 *** 24 ms
;10037 *** 44 ms           avg : 34.67 ms       4.52 times
;test ended..
;100003 *** 91 ms
;100019 *** 83 ms
;100043 *** 92 ms          avg : 88.67 ms       2.56 times
;test ended..
;1000003 *** 294 ms
;1000033 *** 311 ms
;1000037 *** 317 ms        avg : 307.33 ms      3.47 times
;test ended..
;10000019 *** 988 ms
;10000079 *** 954 ms
;10000103 *** 976 ms       avg : 972.67 ms      3.16 times (exactly root10!)
;test ended..
;100000007 *** 3098 ms
;100000037 *** 3141 ms
;100000039 *** 2995 ms     avg : 3078 ms        3.16 times (exactly root10!)
;test ended..
;1000000007 *** 9575 ms
;1000000009 *** 9971 ms
;1000000021 *** 9905 ms    avg : 9817 ms        3.18 times
;test ended..

;이론적으로 n(size of problem)이 10배가 될 때마다 걸리는 시간이 root(10)=약3.16배가 된다.
;시험결과 큰 n에 대해서 'root(10) prediction'이 맞았음을 확인할 수 있다.

;이 결과는 'our machine에서 수행하는데 걸리는 시간과 계산에 필요한 step수는 비례한다.'라는 사실과도 잘 맞는다.
;(둘다 세타(root(n))이므로..)
