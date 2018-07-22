(define (fast-* a b)
  (fast-*-iter a b 0))

(define (fast-*-iter a b p)
  (cond ((= b 0) 0)
        ((= b 1) (+ a p))
        ((even? b) (fast-*-iter (+ a a) (halve b) p))
        (else (fast-*-iter a (+ b -1) (+ a p)))))

(define (halve n)
  (/ n 2))
