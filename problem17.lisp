;;;problem17
(defun get-eng-str (n)
  (let ((str (format nil "~r" n)))
    (if (and (<= 100 n)
	     (<  n 1000)
	     (not (zerop (mod n 100))))
	(format nil "~a~a" str "and")
	str)))

(defvar *eng-strs*
  (do ((i 1 (1+ i))
       (strs '()))
      ((> i 1000) strs)
    (push (get-eng-str i) strs)))

(let ((result
       (reduce #'+ 
	       (mapcar #'length
		       (mapcar #'(lambda (x)
				   (remove #\Space
					   (remove #\Newline 
						   (remove #\- x))))
			       *eng-strs*)))))
  (format t "~a~%" result))
