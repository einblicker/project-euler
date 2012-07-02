;;;problem29
(defun solve ()
  (let ((result (loop for i from 2 to 100 with acc finally (return acc) do
		     (loop for j from 2 to 100 do
			  (setf acc (adjoin (expt i j) acc))))))
    (length result)))

(format t "~a~%" (solve))
