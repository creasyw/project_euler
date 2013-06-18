#lang racket
(require "../number.rkt")
(foldl * 1 (pythagorean? 1000))