#lang racket

(require 2htdp/image)

(provide
 g o s w gas oil solid water ;; primitive phases start with lowercase letter
 G O S W Gas Oil Solid Water ;; container phases start with capital letter
 new-atom new-cont ;; helper functions for defining new primtives and containers
 σ : @ & connect mix enclose ;; binary operators
 ^ overlap ;; ternary operator
 )

(define r 40) ;; radius for use in function defs
(define default-style "solid") ;; default shape style 

;; Default colours
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
  (circle r default-style gaseous_fg))

(define o
  (circle r default-style oily_fg))

(define s
  (circle r default-style solid_fg))

(define w
  (circle r default-style watery_fg))

;; Utility function for defining a new atom
;; NOTE: to define p(lastic) -> (define p (new-atom 120 70 150))
(define (new-atom red green blue)
  (circle r default-style (make-color red green blue 200)))

;; Containers
;; NOTE: a container must be second argument when using enclose (@)
(define G gaseous_bg)
(define O oily_bg)
(define S solid_bg)
(define W watery_bg)

;; Utility function for defining a new conainer
;; NOTE: to define P(lastic) -> (define (new-cont 120 70 150))
(define (new-cont red green blue)
    (make-color red green blue 150))

;; Operations

;; Connected (externally)
;; NOTE: referred to as "superposition" in DSF papers
(define (σ x y [orient? "h"])
  (cond [ (equal? orient? "h") (beside x y) ]
        [ (equal? orient? "v") (above x y) ]
        [else "Orientation can only be (h)orizontal or (v)ertical"]
   )
  )

;; Mixed
;; NOTE: "+" symbol used in original DSF papers
;; NOTE: equivalent to disconnection
(define (: x y)
  (define d (* r 2))
  (define dpad (* d 1.4))
  (overlay/align/offset "left" "middle" x dpad 0 y))

;; Overlapped
;; NOTE: not defined in original DSF papers
(define (& x y)
  (define rpad (+ r 5))
  (overlay/align/offset "left" "middle" x rpad 0 y))

;; Enclosure
;; NOTE: occasionally referred to as "inclusion" in original DSF papers
;; NOTE: takes any DSF system and bounds it in a containing phase
(define (@ image color)
  (define w (image-width image))
  (define h (image-height image))
  (define p (/ r 2))
  (underlay (rectangle (+ w p) (+ h p) default-style color) image)
  )

;; Mediately connected (x is connected to y through z)
;; NOTE: example of defining an operator using other operators
;; NOTE: operators with n-arity of n>2 not defined in DSF papers
;; NOTE: historical — Whitehead defined m-connection in Process & Reality
(define (^ x y z)
  (& (: x y) z))

;; Aliases
;; NOTE: these allow a more explicit way of defining formulas

;; Primitives
(define gas g)
(define oil o)
(define solid s)
(define water w)

;; Containers
(define Gas G)
(define Oil O)
(define Solid S)
(define Water W)

;; Operations
(define connect σ)
(define mix :)
(define overlap &)
(define m-connect ^)
(define enclose @)
