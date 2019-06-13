#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (mut a b) (* a b))

(define (product term a next b)
  (accumulate mut 1 term a next b))

(define (next x) (+ x 1))

(define (pi-term n)
  (if (even? n )
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(* (product pi-term 1 next 6) 4.0)
(* (product pi-term 1 next 60) 4.0)

(define (add a b) (+ a b))

(define (sum term a next b)
  (accumulate add 0 term a next b))

(define (inc n) (+ n 1))

(define (cube n) (* n n n))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (accumulate-recu combiner null-value term a next b)
  (if (> a b)
      1
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (product-recu term a next b)
  (accumulate-recu mut 1 term a next b))

(* (product-recu pi-term 1 next 6) 4.0)
(* (product-recu pi-term 1 next 60) 4.0)
