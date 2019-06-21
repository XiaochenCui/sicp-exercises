#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (repeated f times)
  (if (< times 1)
      (lambda (x) x)
      (compose f (repeated f (- times 1)))))

((repeated square 3) 5)
