#lang racket

(require 2htdp/image)

(provide g o s w G O S W σ & : @)

(define r 20)

;; Colours
(define gaseous_fg (make-color 1 1 1 200))
(define gaseous_bg (make-color 1 1 1 150))
(define oily_fg (make-color 220 220 0 200))
(define oily_bg (make-color 250 250 0 150))
(define solid_fg (make-color 160 0 0 200))
(define solid_bg (make-color 120 0 0 150))
(define watery_fg (make-color 0 0 220 200))
(define watery_bg (make-color 0 0 250 150))

;; Primitive parts: g(as), o(il), s(olid), w(ater)
(define g
  (circle r "solid" gaseous_fg))

(define o
  (circle r "solid" oily_fg))

(define s
  (circle r "solid" solid_fg))

(define w
  (circle r "solid" watery_fg))

;; Primitive containers — used with include (@) operator
(define G gaseous_bg)
(define O oily_bg)
(define S solid_bg)
(define W watery_bg)

;; Operations

;; Connecting horizontally
(define (σ x y [orient? "h"])
  (cond [ (equal? orient? "h") (beside x y) ]
        [ (equal? orient? "v") (above x y) ]
        [else "Orientation can only be (h)orizontal or (v)ertical"]
   )
  )

;; Mixing (represents a disconnected collection)
(define (: x y)
  (define d (* r 2))
  (define dpad (+ d 5))
  (overlay/align/offset "left" "middle" x dpad 0 y))

;; Overlapping
(define (& x y)
  (define rpad (+ r 5))
  (overlay/align/offset "left" "middle" x rpad 0 y))

;; Mediately connecting (x is connected to y through z)
(define (^ x y z)
  (& (: x y) z))

;; Inclusion/parthood (takes any DSF system and bounds it in a containing phase)
(define (@ image color)
  (define w (image-width image))
  (define h (image-height image))
  (define p 10)
  (underlay (rectangle (+ w p) (+ h p) "solid" color) image)
  )