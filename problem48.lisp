;;;problem48
(defun solve ()
  (subseq
   (format nil "~a" 
	   (loop for i from 1 to 1000
	      summing (expt i i)))
   (- 3001 10)))

(format t "~a~%" (solve))