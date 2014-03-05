(define (Square a)
	(* a a)
)

(define (SquareThreeSum a b c)
	(+ (* a a) (* b b) (* c c))
)

(define (SquareTwoSumOfThree a b c)
	(- (SquareThreeSum a b c)
		(cond	((and (not (> a b)) (not (> a c))) (Square a))
			((and (not (> b a)) (not (> b c))) (Square b))
			((and (not (> c a)) (not (> c b))) (Square c))
		)
	)
)

