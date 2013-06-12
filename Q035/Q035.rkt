#lang racket
(require "../prime.rkt")
(require "../list.rkt")

(define (circular-prime? num)
  (letrec ((nlst (num->intlst num))
           (len (length nlst)))
    (define (helper count current)
      (cond ((= count len) #t)
            ((not (prime? (intlst->num current))) #f)
            (#t (helper (+ count 1) (cons (last current) (take current (- len 1)))))))
    (helper 0 nlst)))

(define (main limit)
  (length (filter circular-prime? (gen-prime limit))))

(main 1000000)