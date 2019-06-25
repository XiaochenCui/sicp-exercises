#lang sicp

(define (power a b)
  (define (iter x result)
    (if (= 0 x)
        result
        (iter (- x 1) (* result a))))
  (iter b 1))

(define (cons a b)
  (* (power 2 a)
     (power 3 b)))

(define (root a b)
  (define (iter n)
    (if (= 0 (remainder a (power b (+ n 1))))
        (iter (+ n 1))
        n))
  (iter 1))

(define (car z) (root z 2))

(define (cdr z) (root z 3))

(car (cons 11 17))
(cdr (cons 11 17))
