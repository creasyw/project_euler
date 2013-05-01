#lang racket

(provide factorization)
(provide factors)

(define (factorization num)
  (define (extract-two n lst)
    (if (= 0 (modulo n 2)) (extract-two (/ n 2) (cons 2 lst)) lst))
  (define (helper n limit factor lst)
    (if (> factor limit)
        (if (not (= 1 n)) (cons n lst) lst)
        (if (= 0 (modulo n factor))
            (helper (/ n factor) limit factor (cons factor lst))
            (helper n limit (+ factor 2) lst))))
  (letrec ((lst (extract-two num '(1)))
           (left (/ num (foldl * 1 lst))))
    (list-tail (reverse (helper left (sqrt left) 3 lst)) 1)))

(define (prime-factors num)
  (define (helper lst factor count acc)
    (cond ((null? lst) (append acc (list (list factor count))))
          ((= (car lst) factor) (helper (cdr lst) factor (+ count 1) acc))
          (#t (helper (cdr lst) (car lst) 1 (append acc (list (list factor count)))))))
  (let ((factor-list (factorization num)))
    (helper (cdr factor-list) (car factor-list) 1 '())))

(define (factors num)
  (filter (lambda (x) (= 0 (modulo num x))) (range 1 (+ num 1))))