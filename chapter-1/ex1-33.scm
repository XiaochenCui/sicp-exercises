#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a)
           (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

(define (inc a) (+ a 1))

(define (square a) (* a a))

(define (sum-of-prime-squares a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (square n)
    (* n n))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (if (= n 1)
      #f
      (= n (smallest-divisor n))))

(sum-of-prime-squares 2 10)
(sum-of-prime-squares 1 5)

(define (relative-prime? m n)
  (= (gcd m n) 1))

(define (identical x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-relative-primes n)
  (define (filter x)
    (relative-prime? x n))
  (filtered-accumulate filter * 1 identical 1 inc n))

(product-relative-primes 10)
(product-relative-primes 100)
