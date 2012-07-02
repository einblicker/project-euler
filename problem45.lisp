;;;problem45
(defun trianglep (num)
  (let ((n (* (1- (isqrt (1+ (* 8 num)))) 1/2)))
    (and (= n (floor n))
	    (= num (* n (1+ n) 1/2)))))

(defun pentagonalp (num)
  (let ((n (* (1+ (isqrt (1+ (* 24 num)))) 1/6)))
    (and (= n (floor n))
	 (= num (* n (1- (* 3 n)) 1/2)))))

(defun hex (num)
  (* num (1- (* 2 num))))

(defun solve ()
  (loop for i from 144
     for h = (hex i)
     when (and (trianglep h) (pentagonalp h)) do (return h)))

(format t "~a~%" (solve))