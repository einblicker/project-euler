;;;problem59
(defmacro fast-progn (&body body)
  `(locally
       (declare (optimize (speed 3) (safety 0) (debug 0)))
     ,@body))

(defun num2binlis (num)
  (fast-progn
   (nreverse
    (loop for i = num then (floor (/ i 2))
       for m = (mod i 2)
       repeat 7
       collect m))))

(defun binlis2num (lis)
  (fast-progn
   (loop for b across lis
      for i from (1- (length lis)) downto 0
      unless (zerop b) summing (expt 2 i))))

(defmacro bitvec (num)
  `(make-array 7 :element-type 'bit :initial-contents (num2binlis ,num)))

(defmacro asci-a2z (chname &body body)
  (let ((a (char-code #\a)) (z (char-code #\z)))
    `(loop for ,chname from ,a to ,z do ,@body)))

(defmacro chrlis2str (vec)
  `(format nil "~{~C~}" (loop for i in ,vec collect (code-char i))))

(defun xor-3ch (vec &rest chs)
  (loop for byte in vec
       for i from 0
       for ch = (elt chs (mod i (length chs)))
       collect (binlis2num (bit-xor byte (bitvec ch)))))

(defun make-hist (lis)
  (let ((tbl (make-hash-table)))
    (loop for elem in lis 
       for k = (gethash elem tbl)
       do (if (not k) (setf (gethash elem tbl) 1)
	      (setf (gethash elem tbl) (+ k 1))))
    tbl))

(defun sort-hist (hash)
  (sort (loop for k being the hash-keys in hash collect k)
	#'>
	:key #'(lambda (x) (gethash x hash))))

(with-open-file (input "cipher1-sexp.txt")
  (let* ((bytes (loop for i in (read input) collect (bitvec i)))
	 (heads (loop for i in bytes repeat 200 collect i)))
    (asci-a2z ch1
      (asci-a2z ch2
	(asci-a2z ch3
	  (let* ((result (xor-3ch heads ch1 ch2 ch3)) (top10 (subseq (sort-hist (make-hist result)) 0 10)))
	    (when (and (member (char-code #\ ) top10)
		       (member (char-code #\e) top10)
		       (member (char-code #\t) top10)
		       (member (char-code #\a) top10)
		       (member (char-code #\n) top10)
		       (member (char-code #\o) top10)
		       (loop for c in result always (and (>= c 32) (<= c 122))))
	      (let ((result (xor-3ch bytes ch1 ch2 ch3)))
		(print (cons (loop for c in result summing c)
			     (chrlis2str result)))))))))))