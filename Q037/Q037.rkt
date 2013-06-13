#lang racket

;; though generating the whole list of right-trancated and left-trancated
;; will make the structure of code more clear, it is more efficient to
;; generate number while testing it and stop as soon as one number fails
;; the prime test.

;; import prime?
;; import gen-prime
(require "../prime.rkt")
;; import num->intlst
;; import intlst->num
(require "../list.rkt")

(define (trancatable-prime? num)
  (letrec ((nlst (num->intlst num))
           (len (length nlst)))
    (define (helper count)
      (cond ((= count len) #t)
            ((and (prime? (intlst->num (take nlst count)))
                  (prime? (intlst->num (drop nlst count))))
             (helper (+ count 1)))
            (#t #f)))
    (and (prime? num) (helper 1))))

(define (gen-tran-primes limit)
  (filter trancatable-prime? (gen-prime limit)))

(foldl + 0 (drop (gen-tran-primes 1000000) 4))