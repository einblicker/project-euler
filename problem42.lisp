;;;problem42
(defun trianglep (num)
  (let ((n (* (1- (isqrt (1+ (* 8 num)))) 1/2)))
    (and (= n (floor n))
	 (= num (* n (1+ n) 1/2)))))

(defun word-score (word)
  (loop for c across word summing (- (char-code c) (1- (char-code #\A)))))

(defun solve ()
  (with-open-file (in "word-translated.txt")
    (loop for word in (read in)
       count (trianglep (word-score word)))))

(format t "~a~%" (solve))