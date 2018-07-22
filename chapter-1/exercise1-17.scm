(define (fast-mul a b)
  (cond ((= b 1) a)
        ((even? b) (fast-mul (+ a a) (halve b)))
        (else
          (+ a
             (fast-mul a (- b 1))))))

(define (halve n)
  (/ n 2))
