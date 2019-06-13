#lang sicp

(define (cube n) (* n n n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term k)
    (define y (f (+ a (* k h))))
    (if (or (= k 0) (= k n))
        y
        (if (even? k)
            (* 2 y)
            (* 4 y))))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(simpson-rule cube 0 1 10)
(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)
(simpson-rule cube 0 1 10000)
