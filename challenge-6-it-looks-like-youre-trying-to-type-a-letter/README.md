# Challenge 6 - It Looks Like You're Trying to Type a Letter

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
The basic problem of checking words against a list in a performant way is incredibly simple, but the extension could be done in many many ways, choosing the best will be difficult.

The solution needs to be quick, optimised, and have a high quality demonstration; meanwhile, I'm also trying to complete these challenges with languages used by Kilburn's current clients wherever possible. I think I can achieve this by creating the main algorithm in C, compiling to WebAssembly, then serving that up in a pretty way using either Angular or Vue.
