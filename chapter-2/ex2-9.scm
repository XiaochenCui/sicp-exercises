#lang scheme

(define (make-interval a b) (cons a b))

(define lower-bound car)

(define upper-bound cdr)

(define (width z)
  (/ (- (upper-bound z)
        (lower-bound z))
     2.0))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define a (make-interval 4 9))
(define b (make-interval 7 10))

(width a)
(width b)
(width (add-interval a b))
(width (sub-interval a b))
