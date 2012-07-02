;;;problem15
(defun C (n r)
  (labels ((fact-iter (x acc)
	     (if (<= x 1) acc
		 (fact-iter (1- x) (* x acc))))
	   (fact (x)
	     (fact-iter x 1)))
    (/ (fact n)
       (* (fact r) (fact (- n r))))))

(format t "~a~%" (C 40 20))