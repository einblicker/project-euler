;;;problem43
(defun gen-nth-prod (n)
  #'(lambda (lis)
      (loop for i from (1- n) downto 0
	   for j = (expt 10 i)
	   for c in lis
	   summing (* c j))))

(let ((f3 (gen-nth-prod 3)))
  (defun tri-prod (lis)
    (funcall f3 lis)))

(let ((f10 (gen-nth-prod 10)))
  (defun tenth-prod (lis)
    (funcall f10 lis)))

(defun split-num2list (num)
  (loop for n = num then (floor (/ n 10))
     for m = (mod n 10)
     until (zerop n)
     collect m into acc
     finally (return (nreverse acc))))

(defun pick3 (lis)
  (nreverse (cddr 
	     (nreverse 
	      (maplist #'(lambda (a) 
			   (list (first a) (second a) (third a))) lis)))))

(defun primep (num)
  (if (= num 2) t
      (unless (zerop (mod num 2))
	(loop for i from 3 to (isqrt num) by 2 never (zerop (mod num i))))))

(let ((primes (loop for i from 2
		 when (primep i) collect i into c
		 until (= (length c) 7) finally (return c))))
  (defun test (nums)
    (loop for n in nums
       for p in primes
       always (zerop (mod n p)))))

(defun solve ()
  (let ((nums (remove 5 (loop for j to 9 collect j))) (acc 0))
    (loop for i1 in (remove 0 nums) for nums1 = (remove i1 nums) do
	 (loop for i2 in nums1 for nums2 = (remove i2 nums1) do
	      (loop for i3 in nums2 for nums3 = (remove i3 nums2) do
		   (loop for i4 in nums3 for nums4 = (remove i4 nums3) when (evenp i4) do
			(loop for i5 in nums4 for nums5 = (remove i5 nums4) when (oddp i5) do
			     (loop for i7 in nums5 for nums7 = (remove i7 nums5) do
				  (loop for i8 in nums7 for nums8 = (remove i8 nums7) do
				       (loop for i9 in nums8 for nums9 = (remove i9 nums8) do
					    (loop for i10 in nums9 for tmp = (list i1 i2 i3 i4 i5 5 i7 i8 i9 i10) do
						 (when (test (mapcar #'tri-prod (cdr (pick3 tmp))))
						   (incf acc (tenth-prod tmp)))))))))))) acc))

(format t "~a~%" (solve))