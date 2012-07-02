;;;problem31
(defun count-change (x)
  (let ((ponds (list 1 2 5 10 20 50 100 200)))
    (labels ((iter (amount coins)
               (cond ((zerop amount) 1)
                     ((or (minusp amount) (minusp coins)) 0)
                     (t (+ (iter (- amount (elt ponds coins)) coins)
                           (iter amount (1- coins)))))))
      (iter x (1- (length ponds))))))

(defun solve ()
  (count-change 200))

(format t "~a~%" (solve))