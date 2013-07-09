#lang racket


;; import gen-prime
;; import prime?
(require "../prime.rkt")

;; import list-max
(require "../list.rkt")

;; generate list of primes, which summation is less than certain limit
(define (sum-less-than limit)
  (letrec ((lst (gen-prime limit)))
    (define (helper rest acc sum)
      (if (> sum limit) (reverse (drop acc 1))
          (helper (cdr rest) (cons (car rest) acc) (+ sum (car rest)))))
    (helper lst '() 0)))

(define (filter-based-on-sum proc lst)
  (define (helper before after)
    (cond ((null? after) (reverse before))
          ((proc (foldl + 0 (car after))) (helper (cons (car after) before) (cdr after)))
          (#t (helper before (cdr after)))))
  (helper '() lst))

;; the solution is inherently flawed, though it does calculate the right answer...
;; it is based on certain observations:
;; 1) the sume of overall candidates might much smaller than given threshold (100 or 100m)
;; 2) the more smaller primes in the list, the longer the list could achieve
;;    ==> so everytime I move only one step in the smaller side,
;;        but 5 steps in the larger side
(define (q050 limit)
  (letrec ((lst (sum-less-than limit))
           (rg 5))
    (define (helper tlst)
      (letrec ((result (for/list ((i (in-range rg)))
                         (take tlst (- (length tlst) i))))
               (filtered (filter-based-on-sum prime? result)))
        (if (null? filtered) (helper (cdr tlst))
            (longest-sub-list filtered))))
    (foldl + 0 (helper lst))))