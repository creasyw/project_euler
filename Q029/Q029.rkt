#lang racket

(define (distinct-power limit)
  (length (remove-duplicates 
           (flatten
            (map (lambda (a) 
                   (map (lambda(b) (expt a b)) 
                        (range 2 (+ limit 1))))
                 (range 2 (+ limit 1)))))))

(distinct-power 100)