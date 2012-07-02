;;;problem20
(defun fact (n)
  (labels ((iter (x acc)
             (if (= 1 x)
                 acc
                 (iter (1- x) (* x acc)))))
    (iter n 1)))

(format t "~a~%" 
	(loop for i across (format nil "~a" (fact 100))
	   summing (- (char-code i) (char-code #\0))))
