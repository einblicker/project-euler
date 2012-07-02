;;;problem60
(defun inject2 (n1 n2)
  (loop for i = 10 then (* i 10)
       until (< n2 i)
       finally (return (+ (* i n1) n2))))

(with-open-file (in "primes.temp")
  (let ((lst (cdr (read in))))
    (defparameter *primes* (make-array (list (length lst)) :initial-contents lst))))

(let ((len (length *primes*)))
  (defun primep (num)
    (labels ((iter (lo hi)
	       (if (> lo hi) nil
		   (let* ((k (floor (/ (+ lo hi) 2))) (piv (aref *primes* k)))
		     (cond ((= num piv) t)
			   ((> num piv) (iter (1+ k) hi))
			   ((< num piv) (iter lo (1- k))))))))
      (iter 0 (1- len)))))

(defun primep (x)
  (cond ((= x 2) t)
	((oddp x) (loop for i from 3 to (isqrt x) by 2 never (zerop (mod x i))))
	(t nil)))

(defun test (p1 p2)
  (and (primep (inject2 p1 p2))
       (primep (inject2 p2 p1))))

(defmacro prime-loop (p limit &body body)
  `(loop for ,p across (subseq *primes* 1)
	until (< ,limit ,p)
	repeat 200
	do ,@body))

(aref *primes* 36000)

(let* ((sub-prime (subseq *primes* 0 36000))
       (lim (1- (length sub-prime)))
       (max 423841))
  (time (print
	 (block outer
	   (loop for i from 0 to lim for p1 = (aref sub-prime i) 
	      while (> max p1)
	      do
		(loop for j from (1+ i) to lim for p2 = (aref sub-prime j) 
		   while (> max (+ p1 p2))
		   when (test p1 p2) do
		     (loop for k from (1+ j) to lim for p3 = (aref sub-prime k)
			while (> max (+ p1 p2 p3))
			when (and (test p1 p3) (test p2 p3)) do
			  (loop for l from (1+ k) to lim for p4 = (aref sub-prime l) 
			     while (> max (+ p1 p2 p3 p4))
			     when (and (test p1 p4) (test p2 p4) (test p3 p4)) do
			       (loop for m from (1+ l) to lim for p5 = (aref sub-prime m) 
				  while (> max (+ p1 p2 p3 p4 p5))
				  when (and  (test p1 p5) (test p2 p5) (test p3 p5) (test p4 p5)) do
				    (progn
				      (setf max (+ p1 p2 p3 p4 p5))
				      (print (list max p1 p2 p3 p4 p5))))))))))))

(let* ((sub-prime (subseq *primes* 0 2000))
       (lim (1- (length sub-prime))))
  (time (print
	 (block outer
	   (loop for i from 0 to lim for p1 = (aref sub-prime i) do
		(loop for j from (1+ i) to lim for p2 = (aref sub-prime j) when (test p1 p2) do
		     (print (list p1 p2))))))))