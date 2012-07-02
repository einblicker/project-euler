;;;problem37
(defun right-left-subs (num)
  (loop for i = num then (floor (/ i 10))
       collect i
       until (< i 10)))

(defun left-right-subs (num)
  (let ((rls (cdr (right-left-subs num))))
    (cons num
	  (nreverse
	   (loop for i in rls
	      for j = 10 then (* j 10)
	      collect (- num (* j i)))))))

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

(defun all-primep (lst)
  (loop for i in lst always (primep i)))

(defun solve ()
  (loop for i from 13 
     when (and (all-primep (right-left-subs i))
	       (all-primep (left-right-subs i)))
     collect i into c
     until (= (length c) 11)
     finally (return (apply #'+ c))))

(format t "~a~%" (solve))