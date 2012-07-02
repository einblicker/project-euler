;;;problem3
(with-open-file (in "primes.temp")
  (let ((lst (read in)))
    (defvar *ary* (make-array (list (length lst)) :initial-contents lst))))

(defun factors (value)
  (labels ((iter (idx x rest acc)
             (if (>= x rest)
                 (cons rest acc)
                 (if (zerop (mod rest x))
                     (iter idx x (/ rest x) (cons x acc))
                     (iter (1+ idx) (aref *ary* idx) rest acc)))))
    (iter 1 (aref *ary* 0) value (list 1))))

(format t "~a~%" (reduce #'max (factors 600851475143)))