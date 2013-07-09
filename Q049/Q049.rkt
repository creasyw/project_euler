#lang racket

;; import gen-prime
(require "../prime.rkt")

;; import num->intlst
;; import intlst->num
;; import permutations
;; import delete-list
(require "../list.rkt")

;; import arithmetic-sequence
(require "../number.rkt")

;; besides prime, another important phrase in the question
;; is "arithmetic sequence": an = a1+(n-1)d
(define (pp-sequence x)
  (letrec ((basiclst (num->intlst x))
           (lst (map intlst->num
                     (permutations basiclst (length basiclst)))))
    ;; filter duplicated elements due to duplicated digits
    (set->list (list->set (filter prime? lst)))))

(define (permutation-primes)
  (define four-digits?
    (lambda (x) (and (> x 1000) (< x 10000))))
  (letrec ((lst (filter four-digits? (gen-prime 10000))))
    (define (helper rest)
      (or (null? rest)
           (letrec ((pp (pp-sequence (car rest)))
                    (aspp (arithmetic-sequence (sort pp <))))
             (if (>= (length aspp) 3) aspp
                 (helper (delete-list (cdr rest) pp))))))
    (helper lst)))