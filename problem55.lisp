;;;problem55
(defun split-number (num)
  (nreverse
   (loop for i = num then (floor (/ i 10))
      for m = (mod i 10)
      until (zerop i) collect m)))

(defun lis2num (lis)
  (loop for elem in lis
       for i from (1- (length lis)) downto 0
       summing (* elem (expt 10 i))))

(defun reverse-number (num)
  (lis2num (nreverse (split-number num))))

(defun add-reversed (num)
  (+ num (reverse-number num)))

(defun palindp (num)
  (labels ((list-palindp (lis)
	     (let* ((len (length lis)) (half (floor (/ len 2))))
	       (loop for elm1 in lis repeat half
		  for idx = (1- len) then (1- idx)
		  always (eql elm1 (nth idx lis))))))
    (list-palindp (split-number num))))

(defun lycp (num)
  (loop repeat 49
       for x = (add-reversed num) then (add-reversed x)
       when (palindp x) do (return nil) finally (return t)))

(defun solve ()
  (loop for i from 1 to 9999
     count (lycp i)))

(format t "~a~%" (solve))
