#lang racket
;; Code modified from description given by user Mulan at following link
;; https://stackoverflow.com/questions/54621805/visualize-arbitrary-tree-in-racket-using-tree-layout
(require pict
         pict/tree-layout
         )

(provide draw-tree save-tree)

;; Node and tree defs
(define (node a)
  (cc-superimpose
   (disk 50 #:color "white")
   (text (symbol->string a))))

(define (draw atom->pict a)
  (cond ((null? a) #f)
        ((list? a) (match a
                     ((cons op args)
                      (apply tree-layout
                             #:pict (atom->pict op)
                             (map (curry draw atom->pict) args)))
                     (_ 0 #f)))
        (else (tree-layout #:pict (atom->pict a) ))))

;; Convenience function for drawing
(define (draw-tree new-tree)
  (naive-layered (draw node new-tree)))

;; Save image of tree to file
(define (save-tree tree export-path)
  (define img-gen (draw-tree tree))
  (send (pict->bitmap img-gen) save-file export-path 'png))

