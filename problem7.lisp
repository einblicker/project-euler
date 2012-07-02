;;;problem7
(with-open-file (in "primes.temp")
  (let ((lst (read in)))
    (defvar *primes* (make-array (length lst) :initial-contents lst))))

(format t "~a~%" (aref *primes* 10001))
