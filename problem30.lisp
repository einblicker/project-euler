;;;problem30
(defun expr (num n)
  (do* ((i (mod num 10) (mod j 10))
	(j (floor (/ num 10)) (floor (/ j 10)))
	(total 0))
       ((zerop j) (+ (expt i n) total))
    (incf total (expt i n))))

(defun check (x)
  (= x (expr x 5)))

(defun solve ()
  (let ((result (loop for i from 2 to (* 5 (expt 9 5))
		   when (check i) collect i)))
    (apply #'+ result)))

(format t "~a~%" (solve))
