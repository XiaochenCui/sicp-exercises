;Recusive
(define (pascal-recusive row col)
  (cond ((= row 1) 1)
        ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pascal-recusive (- row 1) (- col 1))
                 (pascal-recusive (- row 1) col)))))

;Iteration
;Binomial Coefficients: https://colalg.math.csusb.edu/~devel/IT/main/m12_binomial/src/s01_pascal.html
(define (pascal-iteration row col)
  (/ (fact (- row 1))
     (fact (- col 1))
     (fact (- row col))))

(define (fact n)
  (define (fact-iter count product)
    (if (< n count)
      product
      (fact-iter (+ 1 count) (* count product))))
  (if (= n 0)
    1
    (fact-iter 1 1)))
