;;;problem14
(defvar *lim* 1000000)
(defvar *clzs* (make-array *lim*))

(setf (aref *clzs* 0) 1)

(defmacro fast-progn (&rest body)
  `(locally 
       (declare (optimize (debug 0) (speed 3) (safety 0)))
     ,@body))

(defun get-clz (x) 
  (fast-progn 
   (the fixnum
     (cond ((evenp x) (/ x 2))
	   ((oddp x) (1+ (* x 3)))))))

(defun count-path (num lim)
  (fast-progn
   (declare (fixnum num lim))
   (the fixnum
     (labels ((iter (num lim acc)
		(fast-progn
		 (declare (fixnum num lim acc))
		 (the fixnum 
		   (if (and (< num lim) (not (zerop (aref *clzs* (1- num)))))
		       (+ acc (aref *clzs* (1- num)))
		       (iter (get-clz num) lim (1+ acc)))))))
       (iter num lim 0)))))

(let ((max-num 0) (max-val 0))
  (fast-progn 
   (loop for i from 2 to *lim* do
	(setf (aref *clzs* (1- i)) (count-path i *lim*))
	(when (< max-val (aref *clzs* (1- i)))
	  (setf max-num i)
	  (setf max-val (aref *clzs* (1- i)))))
   (format t "~a~%"  max-num)))