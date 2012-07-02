;;;problem46
(defun primep (num)
  (cond ((= 2 num) t)
	((minusp num) (error "it is illegal argument"))
	(t (unless (zerop (mod num 2))
	     (loop for i from 3 to (isqrt num) by 2 never (zerop (mod num i)))))))

(defun next-prime (x)
  (let ((x1 (1+ x)))
    (if (primep x1) x1 (next-prime x1))))

(defun chrisp (num)
  (loop named out for p = 2 then (next-prime p)
       until (> p num)
       do (loop for i from 1
	       for tmp = (+ p (* 2 (expt i 2)))
	       until (> tmp num)
	       when (= tmp num) do (return-from out t))))

(defun solve ()
  (loop  for i from 9 by 2
     when (and (not (primep i)) (not (chrisp i)))
     do (return i)))

(format t "~a~%" (solve))