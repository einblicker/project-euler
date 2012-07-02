;;;problem58
(defun primep (num)
  (cond ((= 2 num) t)
        ((minusp num) (error "it is illegal argument"))
        (t (unless (zerop (mod num 2))
             (loop for i from 3 to (isqrt num) by 2 never (zerop (mod num i)))))))

(defun solve ()
  (loop for i from 2 by 2
     with cnt-all = 1
     summing
       (loop repeat 4 for j from (- (expt i 2) (1- i)) by i
	  do (incf cnt-all)
	  count (primep j)) into cnt-prm
     until (< (/ cnt-prm cnt-all) 1/10)
     finally (return (1+ i))))

(format t "~a~%" (solve))
