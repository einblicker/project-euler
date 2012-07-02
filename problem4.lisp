;;;problem4
(defun make-sentences (x y)
    (loop for i from x to y collect
	 (loop for j from x to y collect
	      (format nil "~a" (* i j)))))

(defun turnp (str)
  (let* ((len (length str))
	 (half-len (truncate (/ len 2)))
	 (str1 (subseq str 0 half-len))
	 (str2 (subseq (reverse str) 0 half-len)))
    (string= str1 str2)))

(defun flat (x)
  (labels ((rec (x acc)
	     (cond ((null x) acc)
		   ((atom x) (cons x acc))
		   (t (rec (car x) (rec (cdr x) acc))))))
    (rec x nil)))

(format t "~a~%"
	(reduce #'max (mapcar #'parse-integer
			      (flat (remove-if #'null 
					       (mapcar #'(lambda (x) (remove-if-not #'turnp x))
						       (make-sentences 100 999)))))))