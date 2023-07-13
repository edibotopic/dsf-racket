#lang slideshow

(require "../dsf/base.rkt")
(require "../dsf/tree.rkt")
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
 (t "Connected (σ)")
 (t "Subscript (optional 'h' or 'v') indicates orientation")
 (code (σ o w))
 (σ o w))

(slide
  #:title "Operations"
 (t "Mixed (:)")
 (t "Topologically equivalent to mutual disconnection")
 (code (: o w))
 (: o w))

(slide
  #:title "Operations"
 (t "Enclosure (@)")
 (t "Bounds a system in a container (capitalised symbol)")
 (code (@ (: o w) S))
 (@ (: o w) S))

(slide
  #:title "Operations"
 (t "Enclosure (@)")
 (t "Dispersion is inclusion (a bounded multiplicity)")
 (code (@ (: o o) W))
 (@ (: o o) W))

(slide
 #:title "Containers (simple/linear)"
 (t "Example: solid (S)")
 (code (@ w S))
 (@ w S))

(slide
 #:title "Containers (complex/nested)"
 (code (@ (@ w S) O))
 (@ (@ w S) O))

(slide
 #:title "Operations (contd.)"
 (t "Other operations include:")
 (t "overlap (& x y) and")
 (t "mediate connection (^ x y z)") )

(slide
 #:title "Aliases (more explicit)"
 (code (mix solid water))
 (mix solid water))

(slide
 #:title "Infix (Racket support)"
 (code (s . mix . w))
 (s . mix . w))

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

(slide
    #:title "Tree representation"
    (t "Tree with aliases")
    (code (draw-tree complex-tree))
    (draw-tree '(enclose (mix water oil) solid)))