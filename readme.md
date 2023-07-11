# DSF in Racket

Draw topological diagrams based on the Dispersed System Formalism
(DSF).

This repo contains a small Racket module `dsf/base.rkt`
containing definitions to draw a spatial representation given
a valid DSF formula.
Using `dsf/tree.rkt` binary tree representations of the 
the formulas can also be drawn.
A blank `test.rkt` file with the dsf modules
imported and some example code is
provided in the root directory for testing the module.
Accompanying slides written in Racket `docs/slides.rkt`,
and viewable as `docs/slides.pdf`, include example
code and drawings.

# Usage

Make sure you have `racket` and `git` installed.
Copy this repo to your device with `git clone`.

The main module is imported into a Racket project or REPL with:

```rkt
;; Assuming dsf/base.rkt is in the working directory
(require "dsf/base.rkt")
```

As an example, the formula for an emulsion (oil-in-water) can be written:

```rkt
(@ (: o o) W))
```
Entering this in the DrRacket REPL will generate a corresponding
diagram.

The diagram can be stored in a variable and saved as an image to the
`out` directory as follows:

```rkt
(define emulsion (@ (: o o) W))
(save-image emulsion "out/emulsion.png")
```

To draw formulas as binary trees import the necessary module:

```rkt
;; Assuming dsf/tree.rkt is in the working directory
;; NOTE: resolution of the image could be improved
(require "dsf/tree.rkt")
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

# Docs

Currently the docs are just a set of slides written in racket.
They are also a nice demo of how the dsf libraries can be used
in a presentation to generate diagrams.

The slides can be edited:

```bash
vim docs/slides.rkt
```

...previewed:

```bash
slideshow docs/slides.rkt
```

and compiled as a `.pdf` in
the `docs` directory:

```bash
slideshow --pdf -o docs/slides.pdf docs/slides.rkt

```

# Using with Jupyter

There is a [Jupyter kernel for Racket](https://github.com/rmculpepper/iracket) — IRacket — that can be used to run Racket code in a Jupyter notebook.

If you have Jupyter and IRacket installed then DSF modules can be
required as described previously and used to draw diagrams.

An example notebook `dsf.ipynb` is in the `/nb/` folder and can be viewed directly on GitHub.

# Using with Terminal

If you do not use DrRacket and prefer
using the terminal or (neo)vim you need
to do a little bit more work to preview
images as you test your code.

Start a REPL in your terminal with:

```bash
racket
```

To draw some diagrams you will need `dsf/base.rkt` (and or
`dsf/base.rkt`) and to render them
to a frame you will need `racket/gui/base` and `pict`.
Require them in the REPL:

```rkt
(require "dsf/base.rkt")
(require racket/gui/base pict)
```

Now, entering the below code in the REPL will define a DSF formula and
then render the diagram in a separate frame:

```rkt
(define myStructure (@ (@ (σ w o) S) W))

(show-pict myStructure)
```

It would be nice to live-update this image as you change the code but
this is currently not implemented.

# Currently-available DSF Operators

Note: the symbols are chosen largely to mimic those used in the DSF
literature.
Instead of $+$ the colon symbol $:$ is used as the former is needed as a
summing function in the module's implementation.
Semiotically, I also like the colon as it signifies two discrete
entities, aligning with the intuitive definition of mixture
(i.e., if x and y are mixed in z this usually means that they are discrete
with respect to each other while both being contained within z).

## Binary

1. Mixed together (: x y)
2. Connected with (σ x y): note, can orientate vertically with "v" as
   third arg
3. Included within (@ x Y): note, must take a container as second arg
4. Overlapping with (& x y)

## Ternary

5. Mediately connected (^ x y z): note, this means x is
   mediately-connected to y through z

# Purpose

The module consists of helpful functions for drawing 
diagrams according to the Dispersed System Formalism (DSF).
These functions are effectively wrappers for drawing
operations provided in the `2htdp/image` library.

The module defines four primitives — `g`, `o`, `w`, `s` —
for the four phases gas, oil, water and solid.
These primitives and their mixtures can also be 
spatially included in containers, represented by
capitalised versions of these symbols (`G`, `O`,...).
The primitives are shaded darker than their corresponding
containers.

In DSF, two discrete oil and gas phases included in water
is written:

$$(g \ + \ o) \ @ \ w$$

Using `lib/dsf.rkt` we instead write:

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
