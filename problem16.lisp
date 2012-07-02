;;;problem16
(let ((str (format nil "~a" (expt 2 1000))))
  (format t "~a~%" (apply #'+ (loop for i from 0 to (1- (length str)) 
				 collect (- (char-code (aref str i)) 48)))))
