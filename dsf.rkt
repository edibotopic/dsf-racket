#lang racket

(require 2htdp/image)

(provide g o s w G O S W σ_h σ_v : @)

(define r 20)

;; Primitive parts: g(as), o(il), s(olid), w(ater)
(define g
  (circle r "solid" "light gray"))

(define o
  (circle r "solid" "medium yellow"))

(define s
  (circle r "solid" "medium pink"))

(define w
  (circle r "solid" "light blue"))

;; Primitive containers — used with include (@) operator
(define G "dark gray")
(define O "dark yellow")
(define S "dark pink")
(define W "dark blue")

;; Operations

;; Connecting horizontally
(define (σ_h . xs)
  (apply beside xs)
  )

;; Connecting vertically
(define (σ_v . xs)
  (apply above xs)
  )

;; Mixing (represents a disconnected collection) BUG: should take more than two args and recurse
(define (: x y)
  (overlay/offset x -50 0 y))

;; Inclusion (takes any DSF system and bounds it in a containing phase)
(define (@ image color)
  (define w (image-width image))
  (define h (image-height image))
  (define p 10)
  (underlay (rectangle (+ w p) (+ h p) "solid" color) image)
  )
