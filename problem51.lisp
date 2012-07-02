;;;problem51
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

(defun split-num (num)
  (nreverse
   (loop for rest = num then (floor (/ rest 10))
      for m = (mod rest 10)
      until (zerop rest)
      collect m)))

(defun prod-num (lis)
  (loop for num in lis
       for i from (1- (length lis)) downto 0
       for acc = (* num (expt 10 i)) then (+ (* num (expt 10 i)) acc)
       finally (return acc)))

(defun rep (num digit re)
  (let ((lis (split-num num)))
    (setf (elt lis digit) re)
    (prod-num lis)))

(defun test3 (prime)
  (let* ((nums (split-num prime)) (len (length nums)))
    (loop for dig1 to (- len 4) thereis
	 (loop for dig2 from 1 to (- len 3) thereis
	      (loop for dig3 from 1 to (- len 2) thereis
		   (loop for i from (if (or (zerop dig1) (zerop dig2) (zerop dig3)) 1 0) to 9
		      for re = (rep (rep (rep prime dig1 i) dig2 i) dig3 i)
		      while (oddp re)
		      count (primep re) into cnt
		      finally (return (<= 8 cnt))))))))

(defun include3dupp (num)
  (labels ((freq (lis)
	     (loop for i in lis collect (count i lis))))
    (member 3 (freq (split-num num)))))

(defun solve ()
  (loop for prime across *primes*
     for result = (when (include3dupp prime) (test3 prime))
     when result do (return prime)))

(format t "~a~%" (solve))
