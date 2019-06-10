#lang scheme

(provide square)
(provide safe-random)
(provide print)

(define (square n)
  (* n n))

(define (safe-random n)
  (define max 4294967087)
  (if (< n max)
      (random n)
      (random max)))

(define (print s)
  (display s)
  (newline))
