#lang racket
(provide num->intlst)
(provide intlst->num)
(provide product)
(provide permutations)
(provide combinations)
(provide rotate)
(provide list-max)
(provide list-min)
(provide list-pos)
(provide list-pickup)
(provide longer)
(provide longest-sub-list)
(provide delete-element)
(provide delete-list)

;; returning the maximu or minimum element within the list
(define (list-max lst)
  (foldl (lambda (x y) (max x y)) -inf.0 lst))
(define (list-min lst)
  (foldl (lambda (x y) (min x y)) +inf.0 lst))

;; returns a list of integers containing every digit of the "num"
(define (num->intlst-old num)
  (let ((temp (string->list (number->string num))))
    (define (helper lst acc)
      (if (null? lst) (reverse acc)
          (helper (cdr lst) (cons (- (char->integer (car lst)) (char->integer #\0)) acc))))
    (helper temp '())))

(define (num->intlst num)
  (define (helper n acc)
    (if (< n 10) (cons n acc)
        (helper (quotient n 10) (cons (remainder n 10) acc))))
  (helper num '()))

(define (intlst->num lst)
  (define (helper l acc)
    (if (null? l) acc
        (helper (cdr l) (+ (* (car l) (expt 10 (- (length l) 1))) acc))))
  (helper lst 0))

;; the racket implementation of three most often used functions of itertools in Python
;; product('ABCD', repeat=2) -- AA AB AC AD BA BB BC BD CA CB CC CD DA DB DC DD
(define (product lst num)
  (cond ((or (<= num 1) (< (length lst) num)) lst)
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

;; permutations('ABCD', 2) -- AB AC AD BA BC BD CA CB CD DA DB DC
(define (permutations lst num)
  (cond ((or (<= num 1) (< (length lst) num)) lst)
        (#t
         (define (helper left-el left-pos acc)
           (if (= left-pos 1) (foldl append '() 
                                     (map (lambda (x) (map (lambda (y) (append x (list y))) left-el)) acc))
               (map (lambda (x) 
                      (helper (remove x left-el) (- left-pos 1) (map (lambda (y) (append y (list x))) acc)))
                    left-el)))
         (defold append '() (- num 1) 
           (map (lambda (x) (helper (remove x lst) (- num 1) (list (list x)))) lst)))))

;; remove the first element 'el' with all its left-handed elements in the list
;; if there is no 'el', returning the original list
(define (rem-left el lst)
  (define (helper acc)
    (cond ((null? acc) lst)
          ((eq? el (car acc)) (cdr acc))
          (#t (helper (cdr acc)))))
  (helper lst))

;; combinations('ABCD', 2) -- AB AC AD BC BD CD
(define (combinations lst num)
  (define (helper left-el left-pos acc)
    (cond ((= left-pos 1) 
           (foldl append '() 
                  (map (lambda (x) (map (lambda (y) (cons y x)) left-el)) acc)))
          ((= left-pos (length left-el))
           ;; in other branches, two "map" will add 2 additional pairs of list parentheses
           ;; to use defold at the end, add 2 lists to match with others
           (foldl append '() (list (list (map (lambda (x) (append x left-el)) acc)))))
          (#t (letrec ((tail (- left-pos 1))
                       (head (- (length left-el) tail)))
                (displayln tail)
                (displayln head)
                (displayln left-pos)
                (displayln left-el)
                (map (lambda (x) (helper (rem-left x left-el) tail
                                         (map (lambda (y) (cons x y)) acc))) 
                     (take left-el head))))))
  (defold append '() (- num 1)
    (map (lambda (x) (helper (rem-left x lst) (- num 1) (list (list x)))) (take lst (+ 1 (- (length lst) num))))))


(define (rotate lst)
  (let ((limit (length lst)))
    (define (helper count current acc)
      (if (= count limit) acc
          (helper (+ count 1)
                  (cons (last current) (take current (- limit 1)))
                  (cons current acc))))
    (helper 0 lst '())))

;; return the index of elements satisfying the predicate
(define (list-pos pred lst)
  (filter (lambda (ref) (list-ref (map pred lst) ref))
          (range (length lst))))

;; return the sub-list whose indices are specified
(define (list-pickup lst indices)
  (define (helper rest acc)
    (if (null? rest) (reverse acc)
        (helper (cdr rest) (cons (list-ref lst (car rest)) acc))))
  (letrec ((sorted (sort indices <)))
    (if (or (null? sorted)
            (< (first sorted) 0)
            (> (last sorted) (- (length lst) 1)))
        '()
        (helper indices '()))))

;; return the longer list
(define (longer la lb)
  (if (> (length la) (length lb)) la lb))

;; delete certain element in a list and return the rest
(define (delete-element lst element)
  (letrec ((len (length lst)))
    (define (helper lb ub)
      (letrec ((ref (+ lb (quotient (- ub lb) 2)))
               (probe (list-ref lst ref)))
        (cond ((= element probe)
               (append (take lst ref) (drop lst (+ ref 1)))) 
              ((= ub lb) lst) ; cannot find
              ((> element probe) (helper (+ ref 1) ub))
              (#t (helper lb ref)))))
    (helper 0 (- (length lst) 1))))

;; delete elements of list b from list a
(define (delete-list la lb)
    (if (null? lb) la
        (delete-list (delete-element la (car lb)) (cdr lb))))

;; return the longest sub-list
(define (longest-sub-list lst)
  (define (helper rest result)
    (cond ((null? rest) result)
          ((> (length (car rest)) (length result))
           (helper (cdr rest) (car rest)))
          (#t (helper (cdr rest) result))))
  (helper lst '()))