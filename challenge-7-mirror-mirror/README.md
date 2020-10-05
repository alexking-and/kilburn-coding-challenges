# Challenge 6 - Mirror Mirror

## Problem
[Here is a 13x13](data/grid.txt) grid of mirrors placed onto a board, where the rows and columns of the board represent upper and lower case letters of the alphabet.
After leaving from any letter on the board, the mirrors will act to alter the direction of travel by 90 degrees.
Your task is to write a program which, given an encoded word, can traverse through the board of mirrors and arrive at each decoded letter, revealing the decoded word at the end.

The word to be decoded is `TmixcmCZhxDmrmoaQhxhzmfCDnohyehhxW`.

[This gif](https://i.imgur.com/uML0tJK.gif) (of a slightly different board) might help you to understand the task better if you're unsure.
The winning solution will be one that is clean and makes good use of language features, with extra kudos given for visualising the process.

## Solution
I wanted to give myself a break from the useful solutions, so I figured it was time to whip out an obscure functional language I haven't touched for 5 years; this actually worked out surprisingly great: the problem fit very well into a functional context, and concept-wise OCaml is very similar to Haskell.

Use your OCaml tools of choice to build and run, the easiest would be either `ocaml mirror.ml` or `ocamlc -c mirror.mli && ocamlc mirror.ml -o mirror && ./mirror`.
