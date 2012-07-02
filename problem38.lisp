;;;problem38
(defun include-1-9? (num)
  (let ((rest-nums (loop for i from 1 to 9 collect i)))
    (loop repeat 9
       for d = num then (floor (/ d 10))
       for m = (mod d 10)
       do (setf rest-nums (remove m rest-nums :count 1))
       until (zerop d)
       finally (return (and (null rest-nums) (< d 10))))))

(defun cons-prod (num lst)
  (labels ((cnt-dig (n)
	     (loop 
		for i from 0
		for d = n then (floor (/ d 10))
		for m = (mod d 10)
		until (zerop d)
		finally (return i))))
    (loop for n in lst
       for part = (* n num)
       for dig = (cnt-dig part)
       for rad = (expt 10 (+ (if (= dig (cnt-dig num)) 0 (- dig (cnt-dig num))) (cnt-dig num)))
       for acc = 0 then (* acc rad)
       do (incf acc part)
       finally (return acc))))

(defun solve ()
  (loop for cons in (cdr (loop for i from 1 to 4 collect i into c collect (copy-list c)))
     with max = (expt 10 9)
     maximize (loop for i from 1 to 50000
		 for result = (cons-prod i cons)
		 while (< result max)
		 when (include-1-9? result) maximize result)))

(format t "~a~%" (solve))

