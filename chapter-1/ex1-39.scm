#lang sicp

(define (cont-frac n d k)
  (define (item x)
    (/ (n x)
       (+ (d x)
          (if (= x k)
              0
              (item (+ x 1))))))
  (item 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1) x (- (* x x))))
             (lambda (i)
               (- (* i 2) 1))
             k))

(tan-cf 0.25 5)
(tan-cf 0.25 10)
(tan-cf 0.5 10)
(tan-cf 1.0 10)
(tan-cf 0.785398 10) ;45 degrees
