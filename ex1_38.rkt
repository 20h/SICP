#lang racket

;e = 2.71828182845904523536028747135266249775724709369995

;generate recursive process
(define (cont-frac n d k)
  (define (cont-frac-recursive i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-recursive (+ i 1))))))
  (cont-frac-recursive 1))


(define (D-Euler i) ;Euler D(i)
  (if (= 0 (remainder (+ i 1) 3))
    (- i (floor (/ i 3)))
    1))

(+ 2
   (cont-frac (lambda (i) 1.0)
           D-Euler
           10000))


;2.7182818284590455

  