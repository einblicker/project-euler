;;;problem53
(defun C (n r)
  (if (= n r) 1
      (labels ((fac (n)
		 (iter 1 n))
	       (iter (acc n)
		 (if (= 1 n) acc
		     (iter (* acc n) (1- n)))))
	(/ (fac n) (* (fac r) (fac (- n r)))))))

(defun solve ()
  (loop for i from 1 to 100 summing
       (loop for j from 1 to i count (<= 1000000 (C i j)))))

(format t "~a~%" (solve))