(define (divisor-of? m n) (zero? (modulo n m)))
(define (factorize n)
  (define (factorize-1 n i result)
    (cond
     ((< n (* i i)) (reverse (if (= n 1) result (cons n result))))
     ((divisor-of? i n) (factorize-1 (/ n i) i (cons i result)))
     (else (factorize-1 n (+ i 2) result))))
  (receive (n result)
           (let prepare-loop ((n n) (result '()))
             (if (divisor-of? 2 n) (prepare-loop (/ n 2) (cons 2 result))
                 (values n result)))
           (factorize-1 n 3 result)))
(define (solve)
  (apply max (factorize 600851475143)))
(define (main argv)
  (display (solve))
  (newline))

