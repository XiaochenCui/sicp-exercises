(load "chapter-1/smallest-divisor.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes low n)
  (cond ((<= n 0) 0)
        ((even? low) (search-for-primes (+ low 1) n))
        ((prime? low) (display (string-append (number->string low) "\n")))
        (else 0)))
