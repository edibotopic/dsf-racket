#lang racket

(require 2htdp/image)

(provide g o s w G O S W σ_h σ_v : @)

;; Primitive parts: g(as), o(il), s(olid), w(ater)
(define g
  (circle 20 "solid" "light gray"))

(define o
  (circle 20 "solid" "medium yellow"))

(define s
  (circle 20 "solid" "medium pink"))

(define w
  (circle 20 "solid" "light blue"))

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

;; Mixing (represents a disconnected collection)
(define (: x y)
  (overlay/offset x -50 0 y))

;; Inclusion (takes any DSF system and bounds it in a containing phase)
(define (@ image color)
  (define w (image-width image))
  (define h (image-height image))
  (define p 10)
  (underlay (rectangle (+ w p) (+ h p) "solid" color) image)
  )
