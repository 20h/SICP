;square root
(define (sqrt-iter guess x)
	(if	(good-enough-square? guess x)
		guess
		(sqrt-iter	(improveSquare guess x)
					x)))

(define (improveSquare guess x)
	(average guess (/ x guess)))
	
(define (average x y)
	(/	(+ x y) 2))

(define (good-enough-square? guess x)
	(< (abs (- (square guess) x)) 0.001))
	
(define (sqrt2 x)
	(sqrt-iter	1.0	x))
	
(define (ErrorTestSq x)
		(GetErrorPercent (sqrt2 x) (sqrt x)))

;cube root
(define (curt-iter guess x)
	(if	(good-enough-cube? guess x)
		guess
		(curt-iter	(improveCube guess x)
					x)))
					
(define (improveCube guess x)
	(/ (+ (/ x (square guess)) (* 2 guess))	3))

(define (good-enough-cube? guess x)
	(< (abs (- (* guess guess guess) x)) 0.001))
	
(define (cubert2 x)
	(curt-iter	1.0	x))

;common	
(define	(GetErrorPercent myvalue solution)
		(* (/	(abs (- myvalue solution))
			solution)
			100))

(cubert2 27)
	
