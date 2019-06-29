#lang scheme

(define (make-interval a b) (cons a b))

(define lower-bound car)

(define upper-bound cdr)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(add-interval (make-interval 4 9) (make-interval 7 10))
