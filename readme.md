# DSF in Racket

Drawing topological diagrams based on the Dispersed System Formalism
(DSF).

This repo contains a small Racket module `dsf.rkt` and
accompanying slides written in Racket `dsf_slides.rkt`.
A blank `dsf_test.rkt` file with the dsf module
imported and some commented out formulas is
provided for testing the module.

The module is imported into a Racket project with:

```rkt
;; Assuming dsf.rkt is in the working directory
(require "dsf.rkt")
```

As an example, the formula for an emulsion (oil-in-water) can be written:

```rkt
(@ (: o o) W))
```
Entering this in the DrRacket REPL will generate a corresponding
diagram.

The image can be stored in a variable and saved as an image to the
`out` directory:

```rkt
(define emulsion (@ (: o o) W))
(save-image emulsion "out/emulsion.png")
```

The slides explaining the module can be run with:

```bash
slideshow dsf_slides.rkt
```

To compile them as a `.pdf` in
the `out` directory run:

```bash
slideshow --pdf -o out/dsf_slides.pdf dsf_slides.rkt

```

# Available Operations

1. Mixed together ($:$) — takes two systems as argument
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
for toying with DSF that I made in
an afternoon.

I chose Racket as it comes with a
batteries-included set of drawing
tools with excellent REPL support.
The language also makes it
easy to create syntax that
closely aligns with the
original DSF formalism.
