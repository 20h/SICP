#lang racket


(define (square a)
	(* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor2 n);; improved version
  (find-divisor2 n 2))

(define (find-divisor2 n test-divisor) ;; improved version
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor2 n (next test-divisor)))))

(define (next n) ;; improved version
  (cond ((= n 2) 3)
        (else (+ n 2))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor2 n)))

(define (looped-prime? n count) ; loop version
  (cond ((> count 0) (and (= n (smallest-divisor2 n)) (looped-prime? n (- count 1))  ))
        (else (= n (smallest-divisor2 n)))))

;(define (looped-prime? n count) ; loop version
;  (cond ((> count 0) (and (= n (smallest-divisor n)) (looped-prime? n (- count 1))  ))
;        (else (= n (smallest-divisor n)))))

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



;before modification

;1009 *** 7 ms
;1013 *** 7 ms
;1019 *** 8 ms
;test ended..
;10007 *** 24 ms
;10009 *** 25 ms
;10037 *** 26 ms
;test ended..
;100003 *** 181 ms
;100019 *** 78 ms
;100043 *** 74 ms
;test ended..
;1000003 *** 252 ms
;1000033 *** 264 ms
;1000037 *** 280 ms
;test ended..
;10000019 *** 860 ms
;10000079 *** 826 ms
;10000103 *** 885 ms
;test ended..
;100000007 *** 2570 ms
;100000037 *** 2799 ms
;100000039 *** 3051 ms
;test ended..
;1000000007 *** 9085 ms
;1000000009 *** 10731 ms
;1000000021 *** 8305 ms
;test ended..


;after modification

;1009 *** 6 ms
;1013 *** 6 ms
;1019 *** 5 ms
;test ended..
;10007 *** 18 ms
;10009 *** 16 ms
;10037 *** 16 ms
;test ended..
;100003 *** 49 ms
;100019 *** 59 ms
;100043 *** 50 ms
;test ended..
;1000003 *** 157 ms
;1000033 *** 166 ms
;1000037 *** 164 ms
;test ended..
;10000019 *** 521 ms
;10000079 *** 515 ms
;10000103 *** 516 ms
;test ended..
;100000007 *** 1626 ms
;100000037 *** 1693 ms
;100000039 *** 1805 ms
;test ended..
;1000000007 *** 5620 ms
;1000000009 *** 5439 ms
;1000000021 *** 5463 ms
;test ended..



;test-divisor의 domain을 절반으로 줄였기 때문에 prime test 역시 두배로 빨라져야 할 것으로 예측했지만, 실제 결과는 그렇지 않았다.
;100000 이상의 소수의 대해서 대략적으로 1.4~1.6배 속도 향상을 볼 수 있다.

;prime test시 불필요한 짝수에 대해서 계산하는 것은 방지했지만,
;프로시저 next에서 if문을 항상 수행해야 하기 때문에 여기서 추가적인 overhead가 발생한 것으로 보인다.
;+ 같은 primitive 대신 user함수 호출하는 것도 overhead의 원인이 될 수 있을 것 같다.


