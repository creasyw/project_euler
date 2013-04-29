#lang racket
(require (planet neil/csv:2:0))

(define next-row
  (make-csv-reader
   (open-input-file "Q008.txt")
   '((separator-chars            #\|)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))
