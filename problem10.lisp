;;;problem10
;;problem3からコピー
(with-open-file (in "primes.temp")
  (let ((lst (read in)))
    (defvar *primes* (make-array (list (length lst)) :initial-contents lst))))

(format t "~a~%"
	(loop repeat (1- (length *primes*))
	   for i = 0 then (1+ i)
	   for prime = (aref *primes* i) then (aref *primes* i)
	   when (< prime 2000000) sum prime))