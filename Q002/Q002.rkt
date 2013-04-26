#lang racket

(define (even-fab limit)
  (define (helper first second acc)
    (letrec ((third (+ first second)))
      (cond ((> third limit) acc)
            ((= 0 (modulo third 2)) (helper second third (+ acc third)))
            (#t (helper second third acc)))))
  (helper 1 2 2))