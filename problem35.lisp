;;;problem35
(defmacro fast-progn (&body body)
  `(locally
       (declare (optimize (speed 3) (safety 0) (debug 0)))
     ,@body))

(defun make-primep (x)
  (fast-progn
    (let ((p-lst (loop for i from 2 to x
		    when (loop for j from 2 to (isqrt i)
			    never (zerop (mod i j)))
		    collect i))
	  (p-vec (make-array (1+ x) :element-type 'boolean :initial-element nil)))
      (loop for p in p-lst do (setf (aref p-vec p) t))
      #'(lambda (z) (aref p-vec z)))))

(let ((f (make-primep 1000000)))
  (defun primep (x)
    (fast-progn
      (funcall f x))))

(defun collect-nums (x)
  (fast-progn
    (labels ((list2num (lst acc)
	       (if (null (cdr lst)) (+ acc (car lst))
		   (list2num (cdr lst) (+ (* (car lst) 10) (* 10 acc))))))
      (let* ((x1 (loop 
		    for i = (mod x 10) then (mod j 10)
		    for j = (floor (/ x 10)) then (floor (/ j 10))
		    collect i into c
		    until (zerop j)
		    finally (return (nreverse c))))
	     (x2 (loop repeat (length x1) 
		    for i = x1 then (append (cdr i) (cons (car i) nil))
		    collect i)))
	(loop for elem in x2 collect (list2num elem 0))))))

(let ((is-cyc-prime (make-array 1000001 :element-type 'boolean :initial-element nil)))
  (defun circle-primep (x)
    (fast-progn
      (when (aref is-cyc-prime x) t)
      (let* ((lst (collect-nums x))
	     (p (loop for i in lst 
		   for is-prime = (primep i)
		   when is-prime collect i
		   when (not is-prime) do (return nil))))
	(if (null p) nil
	    (loop for x in p do (setf (aref is-cyc-prime x) t) finally (return p)))))))

(defun solve ()
  (fast-progn
    (loop for i from 2 to 1000000
       when (circle-primep i) collect i into c
       finally (return (length c)))))

(format t "~a~%" (solve))
