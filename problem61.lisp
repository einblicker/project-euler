(ql:quickload :arnesi)
(ql:quickload :alexandria)
;(ql:quickload :paiprolog)

(defpackage :problem63
  (:use :cl)
  (:import-from :arnesi :enable-sharp-l)
  (:import-from :alexandria :rotate))

(in-package :problem63)

(enable-sharp-l)

(defun palindrome-p (numbers)
  (equal (rotate (mapcar #L(mod !1 100) numbers))
	 (mapcar #L(floor (/ !1 100)) numbers)))

(palindrome-p '(8128 2882 8281))

(defun make-poly-list (fun)
  (loop for n from 1
     for x = (funcall fun n)
     while (<= x 9999)
     when (<= 1000 x) collect x))

(defun filter (list) 
  (remove-if #L(zerop (floor (/ (mod !1 100) 10))) list))

(filter (make-poly-list #L(* !1 (1+ !1) 1/2)))

(time
(loop for x1 in 
     (filter (make-poly-list #L(* !1 (1+ !1) 1/2)))
 do
(loop for x2 in
     (make-poly-list #L(expt !1 2)) do
(loop for x3 in
     (make-poly-list #L(* !1 (1- (* 3 !1)) 1/2)) do
(loop for x4 in
     (make-poly-list #L(* !1 (1- (* 2 !1)))) do
(loop for x5 in
     (make-poly-list #L(* !1 (- (* 5 !1) 3) 1/2)) do
(loop for x6 in
     (make-poly-list #L(* !1 (- (* 3 !1) 2)))
;     do (print (list 'search x1 x2 x3 x4 x5 x6))
     when (palindrome-p (list x1 x2 x3 x4 x5 x6))
     do (list 'answer x1 x2 x3 x4 x5 x6))))))))
