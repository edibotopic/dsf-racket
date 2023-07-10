# DSF in Racket

Draw topological diagrams based on the Dispersed System Formalism
(DSF).

This repo contains a small Racket module `dsf.rkt`
containing definitions to draw a spatial representation given
a valid DSF formula.
Using `dsf_tree.rkt` binary tree representations of the 
the formulas can also be drawn.
A blank `dsf_test.rkt` file with the dsf modules
imported and some commented out formulas is
provided for testing the module.
Accompanying slides written in Racket `dsf_slides.rkt`,
and viewable as `out/dsf_slides.pdf`, include example
code and drawings.

# Usage

The main module is imported into a Racket project or REPL with:

```rkt
;; Assuming dsf.rkt is in the working directory
(require "dsf.rkt")
```

As an example, the formula for an emulsion (oil-in-water) can be written:

```rkt
(@ (: o o) W))
```
Entering this in a DrRacket REPL will generate a corresponding
diagram.

The diagram can be stored in a variable and saved as an image to the
`out` directory as follows:

```rkt
(define emulsion (@ (: o o) W))
(save-image emulsion "out/emulsion.png")
```

To draw formulas as binary trees import the necessary module:

```rkt
;; Assuming dsf_tree.rkt is in the working directory
(require "dsf_tree.rkt")
```

Define the DSF structure again, this time as a list:

```rkt
(define emulsionForTree '(@ (: o o) W))
(draw-tree emulsionForTree)
```

To save the tree image:

```rkt
(save-tree emulsionForTree "out/emulsionForTree.png")
```

The slides explaining the module can be edited and recompiled with:

```bash
slideshow dsf_slides.rkt
```

To compile them as a `.pdf` in
the `out` directory run:

```bash
slideshow --pdf -o out/dsf_slides.pdf dsf_slides.rkt

```

# Using with Terminal

If you do not use DrRacket and prefer
using the terminal or (neo)vim you need
to do a little bit more work to preview
images as you test your code.

Start a REPL in your terminal with:

```bash
racket
```

To draw some diagrams you will need `dsf.rkt` (and or
`dsf_tree.rkt`) and to render them
to a frame you will need `racket/gui/base` and `pict`.
Require them in the REPL:

```rkt
(require "df.rkt")
(require racket/gui/base pict)
```

Now, entering the below code in the REPL will define a DSF formula and
then render the diagram in a separate frame:

```rkt
(define myStructure (@ (@ (σ_h 
w o) S) W))

(show-pict myStructure)
```

It would be nice to live-update this image as you change the code but
this is currently not implemented.

# Available DSF Operators

Note: the symbols are chosen largely to mimic those used in the DSF
literature.
Instead of $+$ the colon symbol $:$ is used as the former is needed as a
summing function in the module's implementation.
Semiotically, I also like the colon as it signifies two discrete
entities, aligning with the intuitive definition of mixture
(i.e., if x and y are mixed in z this usually means that they are discrete
with respect to each other while both being contained within z).

1. Mixed together ($:$) — takes two DSF systems as
   argument
2. Connected horizontally ($σ_h$) — takes n systems as argument
3. Connected vertically ($σ_v$) — takes n systems as argument
4. Included within ($@$) — takes a system and a container as
   arguments

Operator (1) needs work as it should take n arguments and recurse
better when applied multiple times.

# Purpose

The module consists of helpful functions for drawing 
diagrams according to the Dispersed System Formalism (DSF).
These functions are effectively wrappers for drawing
operations provided in the `2htdp/image` library.

The module defines four primitives — `g`, `o`, `w`, `s` —
for the four phases gas, oil, water and solid.
These primitives and their mixtures can also be 
spatially included in containers, represented by
capitalised versions of these symbols.
The primitives are colored for distinction and their corresponding
container has a darker shade.

In DSF, two discrete oil and gas phases included in water
is written:

$$(g \ + \ o) \ @ \ w$$

Using `dsk.rkt` we instead write:

$$(@ \ (: \ g \ o) \ W)$$

This could be read:

> disconnected set of gas and oil phases (inner parens)
> 
> included within a containing water phase (outer parens)

When this code is run in DrRacket, or compiled
in a Racket slideshow it will output a diagrammatic
representation of the structure it defines.

This allows a tight-coupling between symbolic and
visual reasoning about these spatial systems.

# Status

Currently, this is mostly a plaything
for toying with DSF, which I made originally
in a single afternoon.

I chose Racket as it comes with a
batteries-included set of drawing
tools with excellent REPL support.
The language also makes it
easy to create syntax that
closely aligns with the
original DSF formalism.
