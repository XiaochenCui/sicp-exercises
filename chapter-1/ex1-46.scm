#lang sicp
(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (iter n)
      (if (good-enough? n)
          n
          (iter (improve n))))
    (iter x)))

(define (close-enough? a b)
  (< (abs (- a b)) 0.00001))

(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
  ((iterative-improve
     (lambda (i) (close-enough? (* i i) x))
     (lambda (i)
       (average i (/ x i))))
   1.0))

(sqrt 80)
