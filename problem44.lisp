;;;problem44
(defun pen (num)
  (/ (* num (1- (* 3 num))) 2))

(defun pentagonalp (num)
  (let ((n (* (1+ (isqrt (1+ (* 24 num)))) 1/6)))
    (and (= n (floor n))
	 (= num (* n (1- (* 3 n)) 1/2)))))

(defun solve ()
  (loop named out for i from 1
     for nth-pen1 = (pen i)
     do (loop for k from 1 to i
	   for nth-pen2 = (pen k)
	   for t1 = (- nth-pen1 nth-pen2)
	   for t2 = (+ nth-pen1 nth-pen2)
	   when (and (pentagonalp t1) (pentagonalp t2)) 
	   do (return-from out t1))))

(format t "~a~%" (solve))
