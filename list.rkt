#lang racket
(provide num->intlst)
(provide product)
(provide permutations)
(provide combinations)
(provide list-max)
(provide list-min)

;; returning the maximu or minimum element within the list
(define (list-max lst)
  (foldl (lambda (x y) (max x y)) -inf.0 lst))
(define (list-min lst)
  (foldl (lambda (x y) (min x y)) +inf.0 lst))

;; returns a list of integers containing every digit of the "num"
(define (num->intlst num)
  (let ((temp (string->list (number->string num))))
    (define (helper lst acc)
      (if (null? lst) (reverse acc)
          (helper (cdr lst) (cons (- (char->integer (car lst)) (char->integer #\0)) acc))))
    (helper temp '())))

;; the racket implementation of three most often used functions of itertools in Python
(define (product lst num)
  (cond ((or (<= num 1) (<= (length lst) num)) lst)
        ((= num 2) (foldl append '()
                          (map (lambda (x) (map (lambda (y) (list x y)) 
                                                (reverse lst))) 
                               lst)))
        (#t (reverse (foldl append '()
                            (map (lambda (x) (map (lambda (y) (append (list x) y)) 
                                                  (product lst (- num 1))))
                                 lst))))))

;; because nested "map" will generate nested list
;; this function is to unpact the unnecessary nested layers
(define (defold proc init times lst)
  (if (= times 1) (foldl proc init lst)
      (defold proc init (- times 1) (foldl proc init lst))))

(define (permutations lst num)
  (cond ((or (<= num 1) (<= (length lst) num)) lst)
        (#t
         (define (helper left-el left-pos acc)
           (if (= left-pos 1) (foldl append '() (map (lambda (x) (map (lambda (y) (append x (list y))) left-el)) acc))
               (map (lambda (x) (helper (remove x left-el) (- left-pos 1) (map (lambda (y) (append y (list x))) acc))) left-el)))
         (defold append '() (- num 1) (map (lambda (x) (helper (remove x lst) (- num 1) (list (list x)))) lst)))))

;; remove the first element 'el' with all its left-handed elements in the list
;; if there is no 'el', returning the original list
(define (rem-left el lst)
  (define (helper acc)
    (cond ((null? acc) lst)
          ((eq? el (car acc)) (cdr acc))
          (#t (helper (cdr acc)))))
  (helper lst))

(define (combinations lst num)
  (define (helper left-el left-pos acc)
    (if (= left-pos 1) (foldl append '() (map (lambda (x) (map (lambda (y) (append x (list y))) left-el)) acc))
        (letrec ((tail (- left-pos 1))
                 (head (- (length left-el) tail)))
          (map (lambda (x) (helper (rem-left x left-el) tail (map (lambda (y) (append y (list x))) acc))) (take left-el head)))))
  (defold append '() (- num 1) (map (lambda (x) (helper (rem-left x lst) (- num 1) (list (list x)))) lst)))