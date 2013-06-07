#lang racket

;; digit 0 is not in the list of pandigit
;; adding it in the set  makes identifying pandigits easier
;; via just testing whether the resulting set is empty.
(define digits (set 0 1 2 3 4 5 6 7 8 9))

(define (disassemble n dset)
  (let ((r (remainder n 10))
        (q (quotient n 10)))
    (cond ((or (= r 0) (not (set-member? dset r))) (set))
          ((= q 0) (set-remove dset r))
          (#t (disassemble q (set-remove dset r))))))

(define (pandigit a b)
  (letrec ((r1 (disassemble a digits))
           (r2 (disassemble b r1))
           (product (* a b))
           (r3 (disassemble product r2)))
    (if (= 1 (set-count r3)) product 0)))

(define (main)
  (let ((ua 100) (ub 5000) (result (set)))
    (define (looper a b acc)
      (cond ((= a ua) acc)  ;; end of the loops
            ((= b ub) (looper (+ a 1) (+ a 1) acc))
            (#t (let ((p (pandigit a b)))
                  (if (= p 0) (looper a (+ b 1) acc)
                      (looper a (+ b 1) (set-add acc p)))))))
    (foldl + 0 (set->list (looper 2 1000 result)))))

(main)