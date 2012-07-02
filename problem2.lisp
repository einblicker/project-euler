;;;problem2
(format t "~a"
	(apply #'+
	       (remove-if-not #'evenp
			      (let ((acc (list 1 0)))
				(labels ((next-fib-list ()
					   (push (+ (car acc) (cadr acc)) acc)))
				  (do ()
				      ((> (car acc) 4000000) (cdr acc))
				    (next-fib-list)))))))