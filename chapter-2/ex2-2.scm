#lang sicp

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (print-segment seg)
  (newline)
  (display "segment:")
  (print-point (start-segment seg))
  (print-point (end-segment seg)))

(define (midpoint-segment seg)
  (make-point
    (/ (+ (x-point (start-segment seg))
          (x-point (end-segment seg)))
       2)
    (/ (+ (y-point (start-segment seg))
          (y-point (end-segment seg)))
       2)))

(print-point (make-point 3 4.5))

(print-point (midpoint-segment
               (make-segment (make-point 1.7 5.2)
                             (make-point 3.9 11.1))))
