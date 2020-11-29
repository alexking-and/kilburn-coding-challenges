# Challenge 6 - It Looks Like You're Trying to Trype a Letter

## Problem
We're all familiar with red squiggly lines when we make typing mistakes in some of the more popular text editors.
Ever considered what's going on behind the scenes?
Your challenge is to write a spell-checking algorithm which is, at the very least, capable of evaluating arbitrary input words to rapidly determine whether or not the word is misspelled.

For bonus marks, your algorithm will be capable of displaying at what point the word could no longer possibly be correct.
For example, in the word `dictionorie`, you might output information such as: `diction[orie]` to denote that the word was potentially acceptable up until `orie`, as there are 6 possible words which begin with `diction`.

A dictionary is provided [here](dict.txt).

You'll notice the dictionary is almost 173,000 lines long, which means that you'll need to be rather careful how you design your code, the data structures you use, and which technology/language you choose to implement it in.
The winning solution will be one which is able to run quickly, is well optimised, and has the highest quality demonstration.

## Solution
My first true failure in these challenges! My original idea was, following on from my experiments with WebAssembly last time, write an easy, super-fast word lookup algorithm in C using a binary search tree, compile to WebAssembly, then use either Vue or Angular to present it nicely; this would have allowed me to refresh my C skills, delve a bit depper into WebAssembly, and pick up a front-end framework I haven't used before.

Picking C was a huge mistake and I quickly remembered WHY I haven't used it in a while; after spending a bunch of time faffing about with how to read files, how to correctly allocate memory for structs and strings, and how to use emscripten to allow it to compile to webm and be accessible from Javascript, I lost ~~my will to live~~ any enthusiasm I had for the solution and couldn't bring myself to even finish even just the algorithm, let alone the front end.

If I were to do this again, I'd use Rust in place of C, which can also target WebAssembly and stay relatively fast while being a *much* more pleasant coding experience. I would still like to brush up on my C skills, but perhaps I need to ease myself in a bit more gently.
