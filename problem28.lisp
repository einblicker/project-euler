;;;problem28
(defun diag-collect (num)
  (do ((x 1 (car acc)) (y 2 (+ y 2)) (acc '(1)))
      ((>= x (expt num 2)) acc)
    (loop for i from 1 to 4 do
	 (push (+ x (* i y)) acc))))

(defun solve ()
  (apply #'+ (diag-collect 1001)))

(format t "~a~%" (solve))
