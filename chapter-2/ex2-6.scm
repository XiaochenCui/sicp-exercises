#lang scheme

(require "../stdlib.scm")

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

((two (lambda (x)
        (print x)
        x))
 "hello")

(((lambda (f) (lambda (x) (f (f x)))) (lambda (x) (print x) x)) "hello")
((lambda (x) ((lambda (x) (print x) x) ((lambda (x) (print x) x) x))) "hello")
((lambda (x) (print x) x) ((lambda (x) (print x) x) "hello"))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(define (church->integer f)
  ((f (lambda (x)
        (+ x 1))) 0))

(church->integer (add two two))

(define (integer->church i . n)
  (let ((n (if (null? n)
               zero
               n)))
    (if (= i 0)
        n
        (integer->church
          (- i 1)
          (lambda (f)
            (lambda (x)
              (f ((n f) x))))))))

(integer->church 100)
