#lang sicp

(define (cont-frac n d k)
  (define (item x)
    (/ (n x)
       (+ (d x)
          (if (= x k)
              0
              (item (+ x 1))))))
  (item 1))

(define (golden-ratio k)
  (/ 1 (cont-frac (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k)))

(golden-ratio 1)
(golden-ratio 2)
(golden-ratio 3)
(golden-ratio 10)
(golden-ratio 15)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        (/ (n i) (+ (d i) result))
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0.0))

(/ 1 (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                10))
