#lang racket
(require "../text_processing.rkt")

(define (string->number filename)
  (let ((st (next-row filename)))
    (displayln filename)
    (define (helper acc)
      (let ((temp (st)))
        (if (null? temp) acc
            (helper (cons (string->number (car temp)) acc)))))
    (helper '())))