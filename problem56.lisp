;;;problem56
(defun digit-sum (num)
  (loop for rest = num then (floor (/ rest 10))
     for m = (mod rest 10)
     until (zerop rest)
     summing m))

(defun mod10p (num)
  (zerop (mod num 10)))

(defun solve ()
  (loop for a from 2 to 99 maximize
       (loop for b from 2 to 99 when (not (mod10p a))
	  maximize (digit-sum (expt a b)))))

(format t "~a~%" (solve))
