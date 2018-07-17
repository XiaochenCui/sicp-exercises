;Recusive
(define (f-recusive n)
  (if (< n 3)
      n
      (+ (f-recusive (- n 1))
         (f-recusive (- n 2))
         (f-recusive (- n 3)))))

;Iteration
(define (f-iteration n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 3)
      (+ a b c)
      (f-iter (+ a b c) a b (- count 1))))
