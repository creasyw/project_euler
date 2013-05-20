#lang racket
(require (planet neil/csv:2:0))

(provide next-row)
(provide concatenate-number)
(provide string->lst)

(define (next-row filename)
  (make-csv-reader
   (open-input-file filename)
   '((separator-chars            #\|)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))

(define (concatenate-number st)
  (define (helper acc)
    (let ((temp (st)))
      (if (null? temp) (string->list acc)
          (helper (string-append acc (car temp))))))
  (helper ""))

(define (stlist->numlist slst)
  (if (null? slst) '()
      (cons (- (char->integer (car slst)) (char->integer #\0)) (stlist->numlist (cdr slst)))))

(define (keep-structure st)
  (define (helper acc)
    (let ((temp (st)))
      (if (null? temp) acc
          (helper (append acc (list (stlist->numlist (string->list (car temp)))))))))
  (helper '()))
      

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
