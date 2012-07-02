;;;problem12
(defun divisors (n)
  (let ((sq (floor (sqrt n))))
    (labels ((iter (x acc)
	       (cond ((< sq x) (cons n acc))
		     ((zerop (mod n x)) (iter (1+ x) (cons (/ n x) (cons x acc))))
		     (t (iter (1+ x) acc)))))
      (iter 2 '(1)))))

(defun tri-maker ()
  (let ((n 1) (acc '(1)))
    (labels ((iter ()
	       (push (+ (incf n) (car acc)) acc)))
      #'(lambda () (progn (funcall #'iter) (car acc))))))

(defun solve ()
  (loop named out
     with get-tri = (tri-maker)
     for tri = (funcall get-tri)
     for len = (length (divisors tri)) 
     when (>= len 501) do (return-from out tri)))

(format t "~a~%" (solve))
