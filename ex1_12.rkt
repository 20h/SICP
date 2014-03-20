#lang racket

(define (GetPascalTriangleElement row col)
  (cond ((and (= row 1) (= col 1)) 1)
        ((< row 1) 0)
        ((< col 1) 0)
        ((> col row) 0)
        (else (+ (GetPascalTriangleElement (- row 1) (- col 1))
                 (GetPascalTriangleElement (- row 1) col)))
   )
)

(GetPascalTriangleElement 1 1)

(GetPascalTriangleElement 2 1)
(GetPascalTriangleElement 2 2)

(GetPascalTriangleElement 3 1)
(GetPascalTriangleElement 3 2)
(GetPascalTriangleElement 3 3)

(GetPascalTriangleElement 4 1)
(GetPascalTriangleElement 4 2)
(GetPascalTriangleElement 4 3)
(GetPascalTriangleElement 4 4)
(GetPascalTriangleElement 5 1)
(GetPascalTriangleElement 5 2)
(GetPascalTriangleElement 5 3)
(GetPascalTriangleElement 5 4)
(GetPascalTriangleElement 5 5)
