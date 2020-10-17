# Challenge 6 - Mirror Mirror

## Problem
You work for Acme LogoWorks' design department and your team have just ended a brainstorming session by saving all of the new client logos they've come up with in ASCII format - because this is a standard practice*.
Unfortunately, in their haste to leave, the team have forgotten to save the names of the companies associated with each logo.
There are several of them, and everybody is too busy watching the latest Apple event to examine them.

You task is to write a program to extract the missing information from each logo, by building a list of the words the logos contain. The order of the words extracted does not matter.

Here are the logos in question:
[[Logo 1]](data/logo1.txt) [[Logo 2]](data/logo2.txt) [[Logo 3]](data/logo3.txt) [[Logo 4]](data/logo4.txt) [[Logo 5]](data/logo5.txt)

The winning solution will be one that is efficient and concise.

**Absolutely not standard practice. Do not re-create*

### Example
```
     A   
     V   
 SERVICES
     A   
     T   
     I   
     O   
TOPGUN   
```
In the above example, your program will extract the words `TOPGUN`, `AVIATION` and `SERVICES`, in no particular order.

## Solution
No special language features will be needed for this so I can use whatever I like. I could get a big language like Java out of the way, but that's not going to be concise. Rust would be ideal for this but I want to avoid repeating a language if I can.
