;;;problem3 素朴に実装してみるとこうなった
(defun factors (value)
  (labels ((iter (x rest acc)
             (if (= value x) acc
                 (if (zerop (mod rest x))
                     (iter x (/ rest x) (cons x acc))
                     (iter (+ x 1) rest acc)))))
    (iter 2 value (list 1))))

(format t "~a" (reduce #'max (factors 13195)))
;;問題通りの600851475143だと終わりそうにないので、13195でテスト
