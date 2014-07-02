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

;y의 각 bound로 나눌때 0이 포함되어 있으면 divide by zero이다..
;알맞은 에러 처리를 하자.
(define (div-interval x y)
  (if (or (not(< 0 (upper-bound y))) (not(< 0 (lower-bound y))))
      (display "Error")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(div-interval (make-interval 15 10) (make-interval 1 2)) ;(5.0, 15.0)

(div-interval (make-interval 15 10) (make-interval 0 2)) ;Error