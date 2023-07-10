#lang slideshow

(require "dsf.rkt")
(require "dsf_tree.rkt")
(require 2htdp/image)
(require slideshow/code)

(slide
 #:title "Dispersed System Formalism (DSF)"
 (t "Draw topological diagrams with DSF")
 (tt "A tiny Racket experiment"))

(slide
 #:title "Primitives"
 (t "Example: water (w)")
 (code w)
 w)

(slide
  #:title "Operations"
 (t "Superposition (σ)")
 (t "Subscript (h or v) indicates orientation")
 (code (σ_h w o s))
 (σ_h w o s))

(slide
  #:title "Operations"
 (t "Mixing (:)")
 (t "Topologically equivalent to mutual disconnection")
 (code (: o w))
 (: o w))

(slide
  #:title "Operations"
 (t "Inclusion (@)")
 (t "Bounds a system in a container (capitalised symbol)")
 (code (@ (: g w) O))
 (@ (: g w) O))

(slide
  #:title "Operations"
 (t "Inclusion (@)")
 (t "Dispersion is inclusion (a bounded multiplicity)")
 (code (@ (: o o) W))
 (@ (: o o) W))

(slide
 #:title "Containers (simple)"
 (t "Example: solid (S)")
 (code (@ w S))
 (@ w S))

(slide
 #:title "Containers (nested)"
 (code (@ (@ w S) W))
 (@ (@ w S) W))

(slide
    #:title "Tree representation"
    (t "Define the tree")
    (code (define complex-tree
            '(@ (: w o) s))))

(slide
    #:title "Tree representation"
    (t "Draw the tree")
    (code (draw-tree complex-tree))
    (draw-tree '(@ (: w o) s)))