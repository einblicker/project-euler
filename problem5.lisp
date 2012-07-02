;;;problem5
(defun integers (n)
  (let ((acc '()) (m (1+ n)))
    (dotimes (i m)
      (push i acc))
    (cdr (nreverse acc))))

(format t "~a~%" (apply #'lcm (integers 20)))