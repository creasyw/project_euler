#lang racket

(define (q044)
  (letrec ((pentagonal (for/list ((i (in-range 1 3000)))
                  (/ (* i (- (* 3 i) 1)) 2)))
           (check-list (list->set pentagonal))
           (diff (for*/list ((i (in-range (length pentagonal)))
                             (j (in-range (+ i 1) (length pentagonal)))
                             #:when (set-member? check-list
                                                 (- (list-ref pentagonal j)
                                                    (list-ref pentagonal i))))
                   (list (list-ref pentagonal i) (list-ref pentagonal j))))
           ;; define comparison function
           (diff-comp<? (lambda (x y) (< (- (cadr x) (car x))
                                         (- (cadr y) (car x)))))
           (diff-sorted (sort diff diff-comp<?))
           (sum (filter (lambda (x) (set-member? check-list
                                                 (+ (car x) (cadr x))))
                        diff-sorted))
           (minimal (car sum)))
    (- (cadr minimal) (car minimal))))
           