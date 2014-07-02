#lang racket

;<주장>
;어떤 combination(연산) 결과의 width는 argument의 width의 함수인데, (add, sub)
;어떤 combination의 결과는 그렇지 않다. (mul, div)

; (1,5) (width:2)
; (2,3) (width:0.5)
;+(3,8) (width:2.5)

;interval A+B=C 라는 연산에서
; A(a1, a2) (width:|a1-a2|/2)
; B(b1, b2) (width:|b1-b2|/2)
; 정의에 의해 C는
; C(a1+b1, a2+b2) 이고,,
; C의 width는 |a1+b1-a2-b2|/2) 인데,, (부호가 헷갈리니까 a1>a2 && b1>b2 라고 하자. (a1,a2)를 (a2,a1)라고 본다고 하여 이 interval 성질이 변하진 않는다.)
; A와 B의 width를 더해보면(add function) C의 width와 같음을 볼 수 있다.
; 즉 add 연산의 경우 그 결과도 argument 각각의 width의 add연산이다.

;반례를 찾기 위해 곱셈을 보자..
;(1,5) * (2,3) = ?
;p1 : 1*2 = 2
;p2 : 1*3 = 3
;p3 : 5*2 = 10
;p4 : 5*3 = 15
;min인 p1과 max인 p4로 interval을 만들면 (2, 15)이다.
;2 * 0.5 = 1 (!= 15) 이다.
; mul 연산의 경우 그 결과가 argument 각각의 width의 mul 연산이 아니다.
