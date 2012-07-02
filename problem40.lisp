;;;problem40
(defun whatd (num)
  (cond ((or (minusp num) (zerop num)) 0)
        ((< num 10) num)
        (t (loop for i = 89 then (+ (* i 10) 9)
	      for acc = (list i) then (push i acc)
	      for j from 2
	      when (< num (* i j))
	      do (return (list acc j))))))

(loop repeat 7
      for i = 1 then (* i 10)
      collect (whatd i))
