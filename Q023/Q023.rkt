#lang racket

;; import combinations
(require "../list.rkt")
;; import factors
(require "../factor.rkt")
;; saving nonduplicated summations
(require racket/set)

;; it is very similar to "amicable" in Q021
(define abundant?
  (lambda (n)
    (letrec ((f1 (factors n))
             (sum (foldl + 0 (take f1 (- (length f1) 1)))))
      (> sum n))))

;; actually, this function also cannot work with large numbers,
;; though there is no memory problem any more.
(define (non-abundant-sum limit)
  (define (gen-lst n acc)
    (cond ((= n limit) acc)
          ((abundant? n) (gen-lst (+ n 1) (append acc (list n))))
          (#t (gen-lst (+ n 1) acc))))
  (define (gen-sum-set lst acc)
    (if (null? (cdr lst)) (foldl + 0 acc)
        (gen-sum-set (cdr lst) 
                     (set-union acc (list->set (map (lambda (x) (+ x (car lst))) (cdr lst)))))))
  (- (foldl + 0 (range limit)) (gen-sum-set (gen-lst 1 '()) (set))))

;; well...
(non-abundant-sum 28123)



;; This CANNOT work because the 'combination' will exhaust the memory

;(define (non-abundant-sum limit)
;  (define (gen-lst n acc)
;    (cond ((= n limit) acc)
;          ((abundant? n) (gen-lst (+ n 1) (append acc (list n))))
;          (#t (gen-lst (+ n 1) acc))))
;  (letrec ((lst (combinations (gen-lst 1 '()) 2))
;           (sumlst (remove-duplicates (map (lambda (x) (+ (car x) (cadr x))) lst)))
;           (all (foldl + 0 (range limit))))
;    (- all (foldl + 0 sumlst))))
