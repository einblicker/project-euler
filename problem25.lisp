;;;problem25
(defun fib (x)
  (labels ((iter (x a b)
	     (cond ((>= 2 x) b)
		   (t (iter (1- x) b (+ a b))))))
    (iter x 1 1)))

(defun solve ()
  (loop
     for i from 1
     for j = (length (format nil "~a" (fib i)))
     when (>= j 1000) do (return i)))

(format t "~a~%" (solve))
