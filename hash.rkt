#lang racket

(provide hash-set-stream)

;; expand the usage for bulk initialization of hash table
;; ht should be a hash table.
;; a, b ... should be pairs with the pattern of (key value)
(define-syntax hash-set-stream
  (syntax-rules ()
    ((hash-set-stream ht a)
     (hash-set! ht (car a) (cdr a)))
    ((hash-set-stream ht a b ...)
     (begin (hash-set! ht (car a) (cdr a))
            (hash-set-stream ht b ...)))))