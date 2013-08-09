#lang racket

(provide find-looper)

;; there is no need for function finding looping fragment
;; because the looping can be uniquely defined by the pair (p, q)
;; which define the loop formula (/ (- (sqrt n) p) q)
(define (find-looper n)
  ;; '() is a dummy return to cope with the right target
  (if (= (sqrt n) (integer-sqrt n)) '()
      (letrec ((sq (sqrt n)))
        (define (helper p q acc)
          (if (member (list p q) acc) (drop acc 1)
              (letrec ((temp (floor (/ (* q (+ sq p)) (- n (* p p)))))
                       (qp (/ (- n (* p p)) q))
                       (pp (- (* qp temp) p)))
                (helper pp qp (cons (list p q) acc)))))
        ;; the initial value for q is 1.0 rather than 1
        ;; because the (member) need to match both value and type
        (helper (integer-sqrt n) 1.0 (list)))))

(define (q064 limit)
  (foldl + 0
         (for/list ((i (in-range 2 (+ limit 1))))
           (if (odd? (length (find-looper i))) 1 0))))

;; testing
;(q064 10000)