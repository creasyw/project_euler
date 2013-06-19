#lang racket

;; import intlst->num
;; import permutations
(require "../list.rkt")

;; import divisible?
(require "../number.rkt")

(define (sub-divisible? lst)
  (letrec ((check-list (list 2 3 5 7 11 13 17))
           (len (length check-list)))
    (define (helper count)
      (or (> count len)
          (let ((num (intlst->num (take (drop lst count) 3))))
            (and (divisible? num (list-ref check-list (- count 1)))
                 (helper (+ count 1))))))
    (helper 1)))

(define (q043)
  (letrec ((lst (range 10))
           (pool (permutations lst (length lst))))
    (define (helper itr acc)
      (cond ((null? itr) acc)
            ((sub-divisible? (car itr)) (helper (cdr itr) (+ acc (intlst->num (car itr)))))
            (#t (helper (cdr itr) acc))))
    (helper pool 0)))