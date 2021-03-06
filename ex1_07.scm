;아래는 수정된 코드(오차율이 매우 감소했다.)
(define (sqrt-iter guess_old guess_new x)
	(if	(new-good-enough? guess_old guess_new)
		guess_new
		(sqrt-iter	guess_new
					(improve guess_new x)
					x)))

;(define (improve guess x)
;	(average guess (/ x guess)))
	
;(define (average x y)
;	(/	(+ x y) 2))

;(define (good-enough? guess x)
;	(< (abs (- (square guess) x)) 0.001))

;증감률이 0.1% 미만이면 enough하다고 간주함.
(define (new-good-enough? guess_old guess_new)
	(< (/ (abs (- guess_old guess_new)) guess_old) 0.001))
	
(define (sqrt2 x)
	(sqrt-iter	1.0 0.9 x))
	
(define	(GetErrorPercent myvalue solution)
		(* (/	(abs (- myvalue solution))
			solution)
			100))
		
(define (ErrorTest x)
		(GetErrorPercent (sqrt2 x) (sqrt x)))

		
;;;;very small number의 경우..
;good-enough? procedure는 예상치와 정답의 차가 0.001 이하이면 예상치를 정답으로 간주하는데, 이것은 문제가 좀 있다.
;만약 0.0001에 대한 해를 구하려고 할 때 (정답은 0.01) 정답과의 차가 0.009 이하가 되는 경우 정답으로 간주한다.
;이때 worst case는 정답과의 차가 0.009일 경우인데,
;실제 답(0.01)과 90% 오차까지 허용하는 셈이다.
;더 작은 숫자에 대한 해를 구하는 경우 허용되는 오차범위는 기하급수적으로 커진다.
;그렇기 때문에 현재의 good-enough? 프로시저는 아주 작은 수의 square root를 구하는데에는 적합하지 않다.


;;;;very larger number의 경우..
;모르겠다.


