为了书写方便，这里用 % 表示 remainder 函数

# Normal order

```scheme
(gcd 206 40)
(gcd 40 (% 206 40)) ; Called once
(gcd (% 206 40) (% 40 (% 206 40))) ; Called twice
(gcd (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))) ; Called four times
(gcd (% (% 206 40) (% 40 (% 206 40))) (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40))))) ; Called seven times
; (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))) = 0
(% (% 206 40) (% 40 (% 206 40))) ; Called four times
2
```

一共调用了 remainder 函数 18 次（1 + 2 + 4 + 7 + 4 = 18）

# Applicative order

```scheme
(gcd 206 40) ; Called once
(gcd 40 6) ; Called once
(gcd 6 4) ; Called once
(gcd 4 2) ; Called once
(gcd 2 0)
2
```

一共调用了 remainder 函数 4 次
