#lang racket

;; import gen-prime
;; import prime
(require "../prime.rkt")

;; import num->intlst
;; import occurence
(require "../list.rkt")

;; I still do not quite get the idea behind this statement:
;; "If you form 8 different numbers with them, at least once the
;; sum of the digits (and the whole number) is divisible by three"

(define (have-recurring? n count)
  (letrec ((lst (num->intlst n))
           (occ (occurence lst)))
    (= (cdr (car occ)) count)))

(define (replace-recurring n)
  (letrec ((s (number->string n))
           (occ (occurence (num->intlst n)))
           (most (number->string (car (car occ)))))
    ;; filter to make sure that every element in the output list
    ;; has the same length diggits
    ;; Counter example: [000109,111109,222109,444109,555109,666109,777109,888109]
    (filter (lambda (x) (= (length (num->intlst n)) (length (num->intlst x))))
            (map string->number (for/list ((i (in-range 10)))
                                  (string-replace s most (number->string i)))))))

(define (q051)
  (letrec ((limit 8)
           (primes (gen-prime 10000000))
           (digit 3)
           (left (filter (lambda (x) (have-recurring? x digit)) primes)))
    (define (helper rest)
      (or (null? rest)
          (letrec ((lst (filter prime? (replace-recurring (car rest)))))
            (if (= limit (length lst)) lst
                (helper (cdr rest))))))
    (helper left)))