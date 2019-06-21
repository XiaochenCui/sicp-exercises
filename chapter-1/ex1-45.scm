#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (nth-root-damped x nth damp)
  (fixed-point
    ((repeated average-damp damp)
     (lambda (y)
       (/ x (power y (- nth 1)))))
    1.0))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          guess
          (try next))))
  (try first-guess))

(nth-root-damped 2 10 3)

(define (nth-root x nth)
  (fixed-point
    ((repeated average-damp (floor (log nth 2)))
     (lambda (y)
       (/ x (power y (- nth 1)))))
    1.0))

(nth-root 2 258)
