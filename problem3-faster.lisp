;;;problem3-faster
(defun divisor-of (m n)
  (zerop (mod n m)))

(defun factorize (n)
  (labels ((factorize-1 (n i result)
	     (cond
	       ((< n (expt i 2)) (reverse (if (= n 1) result (cons n result))))
	       ((divisor-of i n) (factorize-1 (/ n i) i  (cons i result)))
	       (t (factorize-1 n (+ i 2) result)))))
    (multiple-value-bind (n result) 
	(labels ((prepare-loop (m result)
		   (if (divisor-of 2 m) (prepare-loop (/ n 2) (cons 2 result))
		       (values n result))))
	  (prepare-loop n (list)))
      (factorize-1 n 3 result))))
(factorize 12)
