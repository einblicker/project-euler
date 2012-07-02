;;;problem6
(format t "~a~%"
	(let ((min 1) (max 100))
	  (- (expt (loop for i from min to max summing i) 2)
	     (loop for i from min to max summing (expt i 2)))))