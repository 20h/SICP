#lang racket

;constructor
(define (make-interval a b) (cons a b))

;selectors
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (get-sign x)
  (cond ((and (< 0 (lower-bound x)) (< 0 (upper-bound x))) 1)
        ((and (> 0 (lower-bound x)) (> 0 (upper-bound x))) -1)
        (else 0)))


;table
;(a1 a2) * (b1 b2)
;에서 interval 정의에 의해서, a2>a1, b2>b1이다. 
;(-  - ) * (-  - )    min:a2*b2 / max:a1*b1
;(-  - ) * (-  + )    min:a1*b2 / max:a1*b1
;(-  - ) * (+  - ) (x)
;(-  - ) * (+  + )    min:a1*b2 / max:a2*b1
;(-  + ) * (-  - )    min:a2*b1 / max:a1*b1
;(-  + ) * (-  + )    min:a1*b2와 a2*b1중 작은것, max:a1*b1과 a2*b2중 큰것
;(-  + ) * (+  - ) (x)
;(-  + ) * (+  + )    min:a1*b2 / max:a2*b2
;(+  - ) * (-  - ) (x)
;(+  - ) * (-  + ) (x)
;(+  - ) * (+  - ) (x)
;(+  - ) * (+  + ) (x)
;(+  + ) * (-  - )    min:a2*b1 / max:a1*b2
;(+  + ) * (-  + )    min:a2*b1 / max:a2*b2
;(+  + ) * (+  - ) (x)
;(+  + ) * (+  + )    min:a1*b1 / max:a2*b2
;정의에 맞지 않는 것들을 골라내면 9가지 케이스가 나온다.

(define (mul-interval2 x y) ; (a1, a2) * (b1, b2)
  (let ((a1 (lower-bound x))
        (a2 (upper-bound x))
        (b1 (lower-bound y))
        (b2 (upper-bound y))
        (x-sign (get-sign x))
        (y-sign (get-sign y)))
  
  (cond ((=  1 x-sign) (cond ((=  1 y-sign) (make-interval (* a1 b1) (* a2 b2)))
                             ((= -1 y-sign) (make-interval (* a2 b1) (* a1 b2)))
                             ((=  0 y-sign) (make-interval (* a2 b1) (* a2 b2)))))
        ((= -1 x-sign) (cond ((=  1 y-sign) (make-interval (* a1 b2) (* a2 b1)))
                             ((= -1 y-sign) (make-interval (* a2 b2) (* a1 b1)))
                             ((=  0 y-sign) (make-interval (* a1 b2) (* a1 b1)))))
        ((=  0 y-sign) (cond ((=  1 y-sign) (make-interval (* a1 b2) (* a2 b2)))
                             ((= -1 y-sign) (make-interval (* a2 b1) (* a1 b1)))
                             ((=  0 y-sign) (make-interval (min (* a1 b2) (* a2 b1)) (max (* a1 b1) (* a2 b2))))))
        (else 0))))

;(mul-interval  (make-interval 2 3) (make-interval -3 -5))
;(mul-interval  (make-interval 2 3) (make-interval 4 5))
;(mul-interval2 (make-interval 2 3) (make-interval -3 -5))
(mul-interval2 (make-interval 95 105) (make-interval 9 11))
(mul-interval2 (make-interval 95 105) (make-interval 8.5 11.5))
(mul-interval2 (make-interval 45 55) (make-interval 8.5 11.5))
(mul-interval2 (make-interval 9.5 10.5) (make-interval 8.5 11.5))
(mul-interval2 (make-interval 9.5 10.5) (make-interval 80 120))
(mul-interval2 (make-interval 9.5 10.5) (make-interval 95 105))