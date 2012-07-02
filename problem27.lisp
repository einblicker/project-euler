;;;problem27
(defun make-expr (a b)
  #'(lambda (n)
      (+ (expt n 2) (* a n) b)))

(defun primep (num)
  (declare (fixnum num))
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (the boolean
    (when (plusp num)
      (loop for fac from 2 to (isqrt num)
	 never (zerop (mod num fac))))))

(defun test (f)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (the fixnum
    (loop for i from 0 
       when (not (primep (funcall f i)))
       do (return i))))

(defun solve ()
  (let ((result (loop for a from -999 to 999 with acc finally (return acc) do
		     (loop for b from -999 to 999 do
			  (push (list (test (make-expr a b)) a b) acc)))))
    (loop for i in result
       with max = 0
       with item = nil
       when (< max (car i))
       do (progn 
	    (setf max (car i) item i))
       finally (return (* (cadr item) (caddr item))))))

(format t "~a~%" (solve))
