# Challenge 8 - JSON Treasure Hunt

## Problem
For this challenge, you're off on a treasure hunt. 
Your task is simple - walk through the [JSON treasure map](data/map.json) and locate the paths to the treasure. 
There are 7 pieces of treasure in total and you'll need to search far and wide, inside objects and arrays to locate them.

The winner will be a well implemented solution which ideally makes use of a lesser obvious choice of language to find the paths.

### Example
For the following treasure map:
```
{
  "name": "Farhad Khan",
  "address": {
    "line1": "28 Beach Road",
    "line2": "",
    "town": "Treasure"
  },
  "interests": ["clowns", "fish", "treasure"]
} 
```

The expected output is:
```
address -> town
interests(id:2)
```

## Solution
This was a relaxing one after the last challenge. 
I planned to use Java to brush up my classical OOP skills, but it turns out Java's leaned more into the functional side since the last time I used it, so I basically did it like any other functional solution.
