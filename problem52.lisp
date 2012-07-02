;;;problem52
(defun samesetp (lis1 lis2)
  (loop for i in lis1
     with tmp = lis2
     when (member i tmp) do (setf tmp (remove i tmp :count 1))
     else do (return nil)
     finally (return (null tmp))))

(defun split-num (num)
  (nreverse
   (loop for rest = num then (floor (/ rest 10))
      for m = (mod rest 10)
      until (zerop rest)
      collect m)))

(defun test1 (num)
  (loop for i from 2 to 6 always
       (samesetp (split-num num) (split-num (* i num)))))

(defun solve ()
  (loop for i from 1 when (test1 i) do (return i)))

(format t "~a~%" (solve))
