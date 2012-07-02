;;;problem23
(defmacro fast-progn (&body body)
  `(locally 
       (declare (optimize (debug 0) (speed 3) (safety 0)))
     ,@body))

(defun abundp (x)
  (< x (loop for i from 1 to (1- x)
	  when (zerop (mod x i)) summing i)))

(defun solve ()
  (let 
      ((is-added
	(make-array 28124 :element-type 'boolean :initial-element t)))
    (labels ((set-is-added ()
	       (let* ((limit 28123)
		      (lst
		       (loop for i from 1 to limit when (abundp i) collect i))
		      (len (length lst))
		      (abun-nums 
		       (make-array len :initial-contents lst)))
		 (fast-progn
		  (do ((i 0 (1+ i)))
		      ((<= len i))
		    (do ((j 0 (1+ j))
			 (flag nil))
			((or flag (<= len j)))
		      (let ((added (+ (aref abun-nums i) (aref abun-nums j))))
			(if (and (aref is-added added) (<= added limit))
			    (progn 
			      (setf (aref is-added added) nil))))))))))
      (set-is-added)
      (loop
	 for i across is-added
	 for j from 0 to 28123
	 when i sum j))))

(format t "~a~%" (solve))
