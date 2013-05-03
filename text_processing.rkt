#lang racket
(require (planet neil/csv:2:0))

(provide next-row)
(provide concatenate-number)

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