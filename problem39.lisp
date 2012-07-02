;;;problem39
(defun solution-len (p)
  (labels ((expr (a p)
	       (/ (- (* 2 a p) (* p p)) (* 2 (- a p)))))
    (loop with c1 = (/ p 3)
       for a from 1 to c1
       for b = (expr a p)
       until (> a b)
       count (not (typep b 'ratio)))))

(defun solve ()
  (loop for i from 1 to 999
     for s1 = (solution-len i)
     with num = 0 with max = 0
     when (< max s1)
     do (setf max s1 num i)
     finally (return num)))

(format t "~a~%" (solve))