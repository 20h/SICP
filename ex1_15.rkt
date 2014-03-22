#lang racket

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine (/ 3.14 2))


; a. (sine 12.15)를 evaluate 할 때, procedure p가 몇 번 실행되는가? 
; 5번 (12.15/(3^n)) < n 을 만족하는 n을 찾으면 5임.


; b. (sine a)가 evaluated 될 때, space와 number of steps에 대한 order of growth를 구하는 문제.
; size of problem(=angle)는 한 단계를 거칠 때마다 1/3만큼 작아진다.
; 따라서 step수는 세타(log(a, 3))로 볼 수 있다. (base가 3인 로그)
; recursive process이므로 space도 단계 수에 비례하여 증가한다.(procedure호출을 위한 stack공간을 유지하기 위해)
; 따라서 space크기도 세타(log(a, 3))로 볼 수 있다.
