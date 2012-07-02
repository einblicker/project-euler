;;;problem32
(defun make-prod-str (a b)
  (format nil "~a~a~a" a b (* a b)))

(defun include-1-9? (str)
  (when (= 9 (length str))
    (let ((nums (loop for i from 1 to 9 
		   collect (elt (format nil "~a" i) 0))))
      (loop for i across str
	 do (setf nums (remove i nums)))
      (null nums))))

(defun uniq (x)
  (loop for i in x with acc
     do (pushnew i acc)
     finally (return acc)))

(defun solve ()
  (let ((strs 
	 (loop for i from 1 to 999 with acc finally (return acc) do
	      (loop for j from 1 to 9999 
		 when (and (<= (* i j) 99999) (< i j))
		 do (push (list (make-prod-str i j) i j) acc)))))
    (apply #'+
	   (uniq  (mapcar #'(lambda (x) (* (cadr x) (caddr x))) 
			  (remove-if-not #'(lambda (x) (funcall #'include-1-9? (car x))) strs))))))

(format t "~a~%" (solve))