;;;problem50
(with-open-file (in "primes.temp")
  (let ((lst (read in)))
    (defvar *primes* (make-array (list (length lst)) :initial-contents lst))))

(let ((len (length *primes*)))
  (defun primep (num)
    (labels ((iter (lo hi)
	       (if (> lo hi) nil
		   (let* ((k (floor (/ (+ lo hi) 2))) (piv (aref *primes* k)))
		     (cond ((= num piv) t)
			   ((> num piv) (iter (1+ k) hi))
			   ((< num piv) (iter lo (1- k))))))))
      (iter 0 (1- len)))))

(defun solve ()
  (loop for start from 1 to (length *primes*) repeat 100000
     with max = 0
     with cur finally (return cur)
     do (loop for i from start to (length *primes*) summing (aref *primes* i) into acc
	   while (< acc 1000000)
	   count acc into cnt
	   when (and (primep acc) (< max cnt)) do (setf max cnt cur acc))))

(format t "~a~%" (solve))