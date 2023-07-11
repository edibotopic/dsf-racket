#lang racket

(require 2htdp/image)
(require "dsf/base.rkt")
(require "dsf/tree.rkt")

;; Examples of DSF formulas (description of structure followed by code)
;;--------------------------------------------------------------

"Disconnected mix of oil and water:"
(: w o)

"Disconnected mix of oil and water enclosed in gas:"
(@ (: w o) G)

"Connected solid-solid, overlapped with oil and enclosed in water:"
(define comp (σ s s))
(@ (& comp o) W)

"Try a new structure..."

;; Save Structures as Images (uncomment lines to test)
;;-------------------------------------------------------------

;; Example of saving image as .png in /out/ directory:
;; (define emulsion (@ (: o o) W)
;; (save-image emulsion "out/emulsion.png")

;; Tree Representation (uncomment lines to test
;;-------------------------------------------------------------

;; Define a tree
;; (define myStructure
;;  '(@ (: w o) s))

;; Draw a tree
;; (draw-tree myStructure)

;; Save image of a tree
;; (save-tree myStructure "out/myStructure.png")
