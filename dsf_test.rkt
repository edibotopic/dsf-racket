#lang racket

(require "dsf.rkt")

;; Test DSF formulas in a DrRacket REPL

;; Disconnected mix of oil and water:
;; (: w o)

;; Disconnected mix of oil and water in gas:
;; (@ (: w o) G)

;; A two-part solid-solid structure dispersed in water:
;; (define comp (σ_v s s))
;; (@ (: comp comp) W)