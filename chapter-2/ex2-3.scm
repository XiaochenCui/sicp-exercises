#lang sicp

(define (square x) (* x x))

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

(define (len seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (sqrt (+ (square (- (x-point start)
                        (x-point end)))
             (square (- (y-point start)
                        (y-point end)))))))

(define (midpoint-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (make-point
      (/ (+ (x-point start)
            (x-point end))
         2)
      (/ (+ (y-point start)
            (y-point end))
         2))))

(define (make-rectangle a b c)
  (cons (make-segment a b)
        (make-segment b c)))

(define (first-segment r)
  (car r))

(define (second-segment r)
  (cdr r))

(define (perimeter-rectangle r)
  (* (+ (len (first-segment r))
        (len (second-segment r)))
     2))

(define (area-rectangle r)
  (* (len (first-segment r))
     (len (second-segment r))))

(perimeter-rectangle
  (make-rectangle
    (make-point 2 4)
    (make-point 5 10)
    (make-point 1 15)))

(area-rectangle
  (make-rectangle
    (make-point 2 4)
    (make-point 5 10)
    (make-point 1 15)))
