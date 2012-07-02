;;;problem3-sub
(defmacro fast-progn (&body body)
  `(locally 
       (declare (optimize (speed 3) (debug 0) (safety 0)))
     ,@body))

(defun make-prime-list (number)
  (labels ((primep (number)
	     (declare (fixnum number))
	     (fast-progn
	       (when (plusp number)
		 (loop for fac from 2 to (isqrt number) never (zerop (mod number fac))))))
	   (next-prime (number)
	     (declare (fixnum number))
	     (fast-progn
	       (the fixnum
		 (loop for n from number when (primep n) return n)))))
    (let ((primes (list)))
      (do ((p (next-prime 0) (next-prime (1+ p))))
	  ((> p number) (nreverse primes))
	(push p primes)))))

(elt (make-prime-list 200000) 10001)

(with-open-file (out "primes.temp" :direction :output :if-exists :supersede)
  (format out "~a" (make-prime-list 10000000)))