;;;problem26
(defun upto (x)
  (let (acc)
    (dotimes (i x)
      (push i acc))
    (nreverse acc)))

(defun div (num x)
  (floor (/ num x)))

(defun cycle-parag (num)
  (do* ((pre 10 (* 10 b))
        (a (div pre num) (div pre num))
        (b (mod pre num) (mod pre num))
        (acc)
        (acc-cycle)
        (mods)
        (mods-sub))
       ((or (zerop b) (member b mods-sub)) (reverse acc-cycle))
    (push a acc)
    (when (member b mods)
      (push b mods-sub)
      (push a acc-cycle))
    (push b mods)))

(defun solve ()
  (let ((result 
	 (loop for i in (cdr (upto 999)) collect (cycle-parag i))))
    (loop 
       for elem in result
       for i from 0
       with max = 0
       with idx = 0
       when (< max (length elem))
	     do (setf max (length elem) idx i)
	     finally (return (1+ idx)))))

(format t "~a~%" (solve))
