#lang scheme

(define (make-center-percent c p)
  (make-interval
    (- c (* c p))
    (+ c (* c p))))

(define (make-interval a b) (cons a b))

(define lower-bound car)

(define upper-bound cdr)

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (- (center i) (lower-bound i))
     (center i)))

(define a (make-center-percent 19 0.02))
(define b (make-center-percent 25 0.03))

(percent a)
(percent b)
