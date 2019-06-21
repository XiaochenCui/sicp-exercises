#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (repeated f times)
  (if (< times 1)
      (lambda (x) x)
      (compose f (repeated f (- times 1)))))

(define (n-fold-smooth f n)
  (repeated smooth n) f))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))
