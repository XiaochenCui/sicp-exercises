#lang scheme
#|
https://stackoverflow.com/questions/1485022/sicp-making-change
|#
(define (count-change amount)
  (cc amount 5))

(define (cc amount n)
  (cond ((< amount 0) 0)
        ((= n 1) 1)
        (else (+ (cc amount
                     (- n 1))
                 (cc (- amount (get-value n))
                     n)))))

(define (get-value n)
  (cond ((= n 1) 1)
        ((= n 2) 5)
        ((= n 3) 10)
        ((= n 4) 25)
        ((= n 5) 50)))

(count-change 2000)
