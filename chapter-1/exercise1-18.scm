(define (fast-mul a b)
  (fast-mul-iter a b 0))

(define (fast-mul-iter a b p)
  (cond ((= b 0) p)
        ((even? b) (fast-mul-iter (+ a a) (halve b) p))
        (else (fast-mul-iter a (+ b -1) (+ a p)))))

(define (halve n)
  (/ n 2))
