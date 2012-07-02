;;;problem1
(defun mod-3-or-5-p (x)
  (if (or (zerop (mod x 3))
          (zerop (mod x 5)))
      t
      nil))

(format t "~a" (apply #'+
		      (remove-if-not #'mod-3-or-5-p
				     (loop for i from 1 to 1000 collect i))))
