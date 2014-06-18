#lang racket

(define (tan-cf x k)
  (define (tan-cf-recursive i)
    (if (> i k)
        0
        (/ (cond ((= i 1) x) (else (* x x)))
           (- (- (* 2 i) 1)
              (tan-cf-recursive (+ i 1))))))
  (tan-cf-recursive 1))

(define (pi) 3.14159265358979323846264338327950288)

(define (DegreeToRadian degree)
  (* degree (/ (pi) 180.0)))

(tan-cf (DegreeToRadian -90) 100) ; -inf.0
(tan-cf (DegreeToRadian -60) 100) ; -1.732050
(tan-cf (DegreeToRadian -45) 100) ; -1.0
(tan-cf (DegreeToRadian -30) 100) ; -0.577350
(tan-cf (DegreeToRadian 0) 100)   ; 0
(tan-cf (DegreeToRadian 30) 100)  ; 0.577350
(tan-cf (DegreeToRadian 45) 100)  ; 1.0
(tan-cf (DegreeToRadian 60) 100)  ; 1.732050
(tan-cf (DegreeToRadian 90) 100)  ; +inf.0
