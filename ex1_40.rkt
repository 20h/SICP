#lang racket

(define tolerance 0.000000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00000000001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c )))

(newtons-method (cubic 5 3 2) 1000)

;구한 x값(= -4.42407684..)를 the cubic에 다시 넣어보면
;0의 근사치인 0.00000000000003552713678800501 가 나오는 걸 확인할 수 있다.

(let ((x (newtons-method (cubic 5 3 2) 1000)))
  (* (+ (* x x x) (* 5 x x) (* 3 x) 2 )))

