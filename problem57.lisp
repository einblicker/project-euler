;;;problem57
(defun split-number (num)
  (nreverse
   (loop for i = num then (floor (/ i 10))
      for m = (mod i 10)
      until (zerop i) collect m)))

(defun gen-2sqr-facs ()
  (let ((pre (+ 2 1/2)))
    (lambda ()
      (1+ (/ (setf pre (+ 2 (/ pre))))))))

(defun solve ()
  (loop repeat 1000 with f = (gen-2sqr-facs)
     for x = (funcall f)
     for n = (length (split-number (numerator x)))
     for d = (length (split-number (denominator x)))
     count (> n d)))

(format t "~a~%" (solve))