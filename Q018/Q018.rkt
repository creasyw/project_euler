#lang racket
;; using the (string->lst filename)
(require "../text_processing.rkt")
;; using the (max-element lst)
(require "../list.rkt")

;; it is just like the Q015
;; Because the graph could only be traversal via "one direction" in general,
;; there is no need to implement any complicated algorithm,
;; but just "propagating" (or "flooding") the value step by step,
;; and processing the results in the final step would be fine.

(define (max-path filename)
  (let ((pyramid (string->lst filename)))
    (define (helper upper rest)
      (if (null? rest) (max-element upper)
          (letrec ((current (car rest))
                   (rng (length current)))
            (helper (for/list ((i (in-range rng)))
                      (max (+ (list-ref current i) (list-ref upper (max 0 (- i 1))))
                           (+ (list-ref current i) (list-ref upper (min i (- rng 2))))))
                    (cdr rest)))))
    (helper (car pyramid) (cdr pyramid))))

(max-path "Q018.txt")

;; the most interesting part for this solution is the loop in racket =D
;; the for/list could save one inner helper function
;; and make it more concise and straightforward