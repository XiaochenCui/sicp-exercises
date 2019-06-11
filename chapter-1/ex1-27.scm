#lang scheme

(require "../stdlib.scm")

(define (test-fermat-test n result)
  (print n)
  (if (eq? (fermat-test n (- n 1)) result)
      (print "OK")
      (print "FAIL")))

(define (fermat-test n a)
  (cond ((= a 1) true)
        ((= (expmod a n n) a) (fermat-test n (- a 1)))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(test-fermat-test 2 true)
(test-fermat-test 3 true)
(test-fermat-test 4 true)
(test-fermat-test 5 true)
(test-fermat-test 6 true)

(test-fermat-test 561 true)
(test-fermat-test 1105 true)
(test-fermat-test 1729 true)
(test-fermat-test 2465 true)
(test-fermat-test 2821 true)
(test-fermat-test 6601 true)
