#lang racket

(define (square a)
	(* a a))

;for fermat test
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


;for Miller-Rabin test
(define (expmod2 base exp m)
  (cond ((= exp 0) 1)
        ((and (not (= base 1))
              (not (= base (- m 1)))
              (= (remainder (square base) m) 1))
         0) ;nontrivial square root of 1 modulo를 발견하면 0을 리턴한다. ; expmod2 밖에서 체크해도 될듯.
        ((even? exp)
         (remainder (square (expmod2 base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod2 base (- exp 1) m))
                    m))))


(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod2 a (- n 1) n) 1)) ;nontrivial square root of 1 modulo를 발견할 경우 0을 리턴하므로 prime test 결과는 false다.
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime-miller-rabin? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime-miller-rabin? n (- times 1)))
        (else false)))

;Carmichael numbers
;561 1105 1729 2465 2821 6601
(fast-prime-miller-rabin? 561 100)  ; false
(fast-prime? 561 10000)               ; true (fooled)

(fast-prime-miller-rabin? 1105 100) ; false
(fast-prime? 1105 10000)              ; true (fooled)

(fast-prime-miller-rabin? 1729 100) ; false
(fast-prime? 1729 10000)              ; true (fooled)

(fast-prime-miller-rabin? 2465 100) ; false
(fast-prime? 2465 10000)              ; true (fooled)

(newline)
(fast-prime-miller-rabin? 2 10) ;t
(fast-prime-miller-rabin? 3 10) ;t
(fast-prime-miller-rabin? 4 10) ;f
(fast-prime-miller-rabin? 5 10) ;t
(fast-prime-miller-rabin? 6 10) ;f
(fast-prime-miller-rabin? 7 10) ;t
(fast-prime-miller-rabin? 8 10) ;f
(fast-prime-miller-rabin? 9 10) ;f
(fast-prime-miller-rabin? 10 10) ;f
(fast-prime-miller-rabin? 11 10) ;t
(fast-prime-miller-rabin? 12 10) ;f
(fast-prime-miller-rabin? 13 10) ;t
(fast-prime-miller-rabin? 14 10) ;f
(fast-prime-miller-rabin? 15 10) ;f
(fast-prime-miller-rabin? 16 10) ;f
(fast-prime-miller-rabin? 17 10) ;t
(fast-prime-miller-rabin? 18 10) ;f
(fast-prime-miller-rabin? 19 10) ;t
(fast-prime-miller-rabin? 20 10) ;f


;왜 이름이 'nontrivial' square root of 1인지??????
;소수이던 소수가 아니던, (n보다 작은) a가 1또는 n-1일 경우 (a^2 % n)는 항상 1이기 때문에, 계산해보지 않아도 뻔하다.(trivial)
;소수가 아닌 경우 (a^2 % n) 가 1인 경우가 존재할 수 있는데, 그런 a를 nontrivial하다고 표현한 것 같다.(직접 계산을 해봐야 알 수 있으므로)
;(소수인 경우 이런 square root a는 존재하지 않는다.)
;(n이 홀수인 경우 a<n인 a 중 절반 이상이 nontrivial square root of 1을 가진다고 한다. 이런 점 때문에 miller-rabin test가 Carmichael number들에 의해 fooled되지 않는다고 한다.)