# Challenge 2 - "That's a Wrap"

## Problem
Your task is to write a program which takes, as input, [this](data.txt) short story by Guy de Maupassant. Your program is to word-wrap the story into however many lines are necessary in order to have no line longer than 32 characters.

Your program can assume that the only white-space in the source material are space characters.

Your program should wrap hyphenated words correctly. I.e, wrapping the word self-centered could result in self- remaining at the end of one line, and centered moving to the next line.

Your program will prove its validity by outputting the number of lines which are filled to maximum (lines which are precisely 32 characters long).

The winning solution (using any language) will be one which does not use any built-in word-wrapping algorithms, is clean, as efficient as possible and makes good use of the language's features to achieve the correct result.

## Example

`There are many variations of `

`passages of Lorem Ipsum `

`available, but the majority `

`have suffered alteration in `

`some form, by injected humour, `

`or randomised words which don't `

`look even slightly believable.`

Answer: 1 line contains 32 characters (`or randomised words which don't `)

## Solution

I could probably do this solution nicer in JavaScript, but, eh, I do enough of that already. Using Rust has the benefit of producing code that's safe, fast, and, in this case, very memory efficient. Since only one pass is made over the text and I used string slices rather than objects, this solution is linear in both time and memory with respect to the size of the text.

It can be ran by either using `cargo run` in this root folder, or by using `rustc` to compile `src/main.rs` directly and then running the generated executable.
