#lang scheme
(define (count-change amount)
  (cc amount 5 0 #f))

(define (cc amount kinds-of-coins depth is-tail)
  (print (list "(cc " amount " " kinds-of-coins " " depth ")") is-tail)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1)
                     (+ depth 1)
                     #t)
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins
                     (+ depth 1)
                     #f)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (print l (new-line #t))
  (display (apply string-append (format-string l)))
  (unless new-line (display "\n")))

(define (format-string l)
  (map number-to-string l))

(define (number-to-string n)
  (if (number? n)
      (number->string n)
      n))

(count-change 11)
