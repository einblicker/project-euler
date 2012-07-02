;;;problem36
(defun palind-p (str)
  (let* ((len (length str))
	 (half (floor (/ len 2))))
    (loop repeat half
       for c1 across (subseq str 0 half)
       for c2 across (reverse (subseq str half len))
       never (not (char= c1 c2)))))

(defun solve1 (x)
  (let ((b-num (format nil "~b" x))
	(d-num (format nil "~a" x)))
    (and (palind-p d-num)
	 (palind-p b-num))))

(defun solve ()
  (loop for i from 1 to 1000000 when (solve1 i) summing i))

(format t "~a~%" (solve))