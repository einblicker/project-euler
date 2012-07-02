;;;problem47
(with-open-file (in "primes.temp")
  (let ((lst (read in)))
    (defvar *primes* (make-array (list (length lst)) :initial-contents lst))))

(defun factors (value)
  (labels ((iter (idx x rest acc)
             (if (>= x rest)
                 (cons rest acc)
                 (if (zerop (mod rest x))
                     (iter idx x (/ rest x) (cons x acc))
                     (iter (1+ idx) (aref *primes* idx) rest acc)))))
    (iter 1 (aref *primes* 1) value ())))

(defun uniq (lis)
  (loop for i in lis with acc
     do (pushnew i acc)
     finally (return acc)))

(defun solve ()
  (loop for i from 2
     with cnt = 0
     when (= 4 (length (uniq (factors i)))) do (incf cnt)
     else do (setf cnt 0)
     when (= 4 cnt) do (return (- i 3))))

(format t "~a~%" (solve))