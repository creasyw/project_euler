#lang racket

(require "../text_processing.rkt")
(require "../Q008/Q008.rkt")

;; process the matrix
(require htdp/matrix)


(define (string->lst filename)
  (let ((st (next-row filename)))
    (define (process-string str acc)
      (if (null? str) (reverse acc)
          (process-string (cdr str) (cons (string->number (car str)) acc))))
    (define (helper acc)
      (let ((temp (st)))
        (if (null? temp) acc
            (helper (append acc (list (process-string (string-split (car temp)) '())))))))
    (helper '())))

(define (max-element lst)
  (define (helper itr result)
    (cond ((null? itr) result)
          ((> (car itr) result) (helper (cdr itr) (car itr)))
          (#t (helper (cdr itr) result))))
  (helper lst 0))

(define (hproduct lstoflst)
  (define (helper lst result)
    (if (null? lst) result
        (letrec ((temp (car lst))
                 (local (largest-product temp 4)))
          (if (> local result) (helper (cdr lst) local) (helper (cdr lst) result)))))
  (helper lstoflst 0))
      
      

;(define (largest-product filename sidelen)
;  (letrec ((lst (concatenate-number (next-row filename)))
;           (vlargest (vproduct lst))
;           (hlargest (hprodouct lst))
;           (dlargest (dproduct lst)))
;    (max-element (list vlargest hlargest dlargest))))
    
    