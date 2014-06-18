#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "guess : ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next)
           )))
  (try first-guess))

;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

(fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)

;위의 transformation 양변에 x를 더하고 2로 나누면 아래와 같이 average damping(averaging successive approximation to solution)을 만들 수 있다.
(fixed-point (lambda (x) (+ (/ x 2) (/ (log 1000) (* 2 (log x))))) 10.0)

;출력값
;guess : 10.0
;guess : 2.9999999999999996
;guess : 6.2877098228681545
;guess : 3.7570797902002955
;guess : 5.218748919675316
;guess : 4.1807977460633134
;guess : 4.828902657081293
;guess : 4.386936895811029
;guess : 4.671722808746095
;guess : 4.481109436117821
;guess : 4.605567315585735
;guess : 4.522955348093164
;guess : 4.577201597629606
;guess : 4.541325786357399
;guess : 4.564940905198754
;guess : 4.549347961475409
;guess : 4.5596228442307565
;guess : 4.552843114094703
;guess : 4.55731263660315
;guess : 4.554364381825887
;guess : 4.556308401465587
;guess : 4.555026226620339
;guess : 4.55587174038325
;guess : 4.555314115211184
;guess : 4.555681847896976
;guess : 4.555439330395129
;guess : 4.555599264136406
;guess : 4.555493789937456
;guess : 4.555563347820309
;guess : 4.555517475527901
;guess : 4.555547727376273
;guess : 4.555527776815261
;guess : 4.555540933824255
;4.555532257016376

;guess : 10.0
;guess : 6.5
;guess : 5.095215099176933
;guess : 4.668760681281611
;guess : 4.57585730576714
;guess : 4.559030116711325
;guess : 4.55613168520593
;guess : 4.555637206157649
;guess : 4.55555298754564
;guess : 4.555538647701617
;4.555536206185039

; * average damping을 적용했을 때 훨씬 빠르게 결과를 찾는다.