#lang sicp

(define (cont-frac n d k)
  (define (item x)
    (/ (n x)
       (+ (d x)
          (if (= x k)
              0
              (item (+ x 1))))))
  (item 1))

(define (nutural-logarithms k)
  (+ 2.0 (cont-frac (lambda (i) 1.0)
                    (lambda (i)
                      (if (= (remainder i 3) 2)
                          (/ (+ i 1) 1.5)
                          1))
                    k)))

(nutural-logarithms 1)
(nutural-logarithms 2)
(nutural-logarithms 3)
(nutural-logarithms 10)
(nutural-logarithms 15)
