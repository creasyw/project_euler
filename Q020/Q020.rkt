#lang racket
(require "../list.rkt")

(define (factorial n)
  (foldl * 1 (range 1 (+ n 1))))

(define (fact-digit-sum num)
  (foldl + 0 (num->intlst (factorial num))))

(fact-digit-sum 100)