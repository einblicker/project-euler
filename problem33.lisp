;;;problem33
(defun find-same-char (str1 str2)
  (loop named outer for c1 across str1 do
       (loop for c2 across str2 
	  when (char= c1 c2) do (return-from outer c1))))

(defun remove1 (c str)
  (remove c str :count 1))

(defun solve ()
  (let ((result (loop for i from 10 to 99
		   for str1 = (format nil "~a" i)
		   when (loop for j from 10 to 99
			   for str2 = (format nil "~a" j)
			   for same-char = (find-same-char str1 str2)
			   for removed1 = (parse-integer (remove1 same-char str1))
			   for removed2 = (parse-integer (remove1 same-char str2))
			   for org-rat = (/ i j)
			   when (and (< i j) (not (null same-char))
				     (not (zerop removed2))
				     (= (/ removed1 removed2) org-rat)
				     (not (char= same-char #\0))) collect (list i j))
		   collect it)))
    (loop for lis in result with d = 1 with b = 1
	 do (loop for elem in lis do (setf d (* d (car elem))))
	 do (loop for elem in lis do (setf b (* b (cadr elem))))
	 finally (return (denominator (/ d b))))))

(format t "~a~%" (solve))
