;; Attribution-
;; elements of this framework are from 
;; Peter Seibel's book Practical Common Lisp
;;

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
  ,@body))

(defmacro check (&body forms)
  `(combine-results
    ,@(loop for f in forms collect `(report-result ,f ',f))))

(defmacro combine-results (&body forms)
  (with-gensyms (result)
    `(let ((,result t))
      ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
      ,result)))

(defun report-result (result form)
  (format t "~:[FAIL~;pass~] ... ~a~%" result form)
  result)

(defun perform-tests ()
  (check
    (= (+ 1 2) 4)
    (= (+ 1 2 3) 6)
    (= (+ -1 -3) -5)))