#lang racket

(require 2htdp/image)
(require "dsf.rkt")
(require "dsf_tree.rkt")

;; Test DSF formulas (uncomment code with a DSF formula and run)
;;--------------------------------------------------------------

;; Structure: Disconnected mix of oil and water:
;; (: w o)

;; Structure: Disconnected mix of oil and water in gas:
;; (@ (: w o) G)

;; Structure: A two-part solid-solid structure dispersed in water:
;; (define comp (σ_v s s))
;; (@ (: comp comp) W)

;; Save Structures as Images
;;-------------------------------------------------------------

;; Example of saving image as .png in /out/ directory:
;; (define emulsion (@ (: o o) W)
;; (save-image emulsion "out/emulsion.png")

;; Tree Representation
;;-------------------------------------------------------------

;; Define a tree
;; (define complex-tree
;;  '(@ (: w o) s))

;; Draw a tree
;; (draw-tree complex-tree)

;; Save image of a tree
;; (save-tree complex-tree "out/complex-tree.png")
