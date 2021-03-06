#lang scheme

(require "../stdlib.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (safe-random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (when (fast-prime? n 3)
    (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes first last)
  (define (search-iter cur last)
    (when (<= cur last) (timed-prime-test cur))
    (when (<= cur last) (search-iter (+ cur 2) last)))
  (search-iter (if (even? first) (+ first 1) first)
               (if (even? last) (- last 1) last)))

(define runtime current-milliseconds)

(search-for-primes 1000 1019)       ; 1e3
(search-for-primes 10000 10037)     ; 1e4
(search-for-primes 100000 100043)   ; 1e5
(search-for-primes 1000000 1000037) ; 1e6

; As of 2008, computers have become too fast to appreciate the time
; required to test the primality of such small numbers.
; To get meaningful results, we should perform the test with numbers
; greater by, say, a factor 1e6.
(newline)
(search-for-primes 1000000000 1000000021)       ; 1e9
(search-for-primes 10000000000 10000000061)     ; 1e10
(search-for-primes 100000000000 100000000057)   ; 1e11
(search-for-primes 1000000000000 1000000000063) ; 1e12
