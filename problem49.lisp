;;;problem49
(defun primep (num)
  (cond ((= 2 num) t)
	((minusp num) (error "it is illegal argument"))
	((not (zerop (mod num 2)))
	 (loop for i from 3 to (isqrt num) by 2
	    never (zerop (mod num i))))))

(defun difseq (dif start)
  (loop repeat 3 for i from start by dif collect i))

(defun samesetp (lis)
  (labels ((split-num (num)
	     (loop for i = num then (floor (/ i 10))
		  for j = (mod i 10)
		  until (zerop i) collect j into res
		  finally (return (nreverse res))))
	   (same-set2 (lis1 lis2)
	     (loop for i in lis1
		  with tmp = lis2
		  when (member i tmp) do (setf tmp (remove i tmp :count 1))
		  else do (return nil)
		  finally (return (null tmp)))))
    (loop repeat 2
       for rest = lis then (cdr rest)
       for set = (car lis) then (car rest)
       for next-set = (cadr lis) then (cadr rest)
       always (same-set2 (split-num set) (split-num next-set)))))

(defun solve ()
  (labels ((inject3 (lis)
	     (+ (* (expt 10 8) (first lis)) (* (expt 10 4) (second lis)) (third lis)))
	   (flatten (lis)
	     (cond ((null lis) nil)
		   ((atom (car lis)) (cons (car lis) (flatten (cdr lis))))
		   ((listp (car lis)) (flatten (car lis))))))
    (loop for dif from 1000 to 9999 when
	 (loop for base from 1001 to 5000 by 2
	    while (<= (+ (* 2 dif) base) 9999)
	    for tmp = (difseq dif base)
	    when (and (every #'oddp tmp) (samesetp tmp) (every #'primep tmp))
	    collect (inject3 (difseq dif base))) collect it into c
	 when (< 0 (length c)) do (return (nth 1 (flatten c))))))

(format t "~a~%" (solve))