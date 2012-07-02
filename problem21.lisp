;;;problem21
(defun d (n)
  (let ((sq (floor (sqrt n))))
    (labels ((iter (x acc)
	       (cond ((< sq x) acc)
		     ((zerop (mod n x)) (iter (1+ x) (cons (/ n x) (cons x acc))))
		     (t (iter (1+ x) acc)))))
      (reduce #'+ (iter 2 '(1))))))

(defun perfectp (x)
  (= x (d x)))

(defun solve ()
  (apply #'+ 
	 (remove-if #'perfectp
		    (loop for i from 1 to 10000
		       when (= (d (d i)) i) collect i))))

(format t "~a~%" (solve))
