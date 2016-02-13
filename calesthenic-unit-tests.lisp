(use-package :lisp-unit)

(in-package :utils)

(define-test xor-func
  (assert-equal nil (xor-func t t))
  (assert-equal t (xor-func t nil))
  (assert-equal t (xor-func nil t))
  (assert-equal nil (xor-func nil nil)))

(defun xor-func (a b)
  (cond 
    ((eq a b) nil)
    (t t)))

(run-tests xor-func)