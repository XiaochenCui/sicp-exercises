#lang scheme

(require "../stdlib.scm")

(define (reverse l)
  (if (null? (cdr l))
      l
      (append (reverse (cdr l)) (cons (car l) nil))))

(reverse (list 1 4 9 16 25))
