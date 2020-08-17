# Challenge 3 - Eleven?

## Problem
Your task is to create a solution to output the answer to the following mathematical equation: `1 + 1`.

The winning solution (using any languages/components) will be the one which is the most ludicrously complicated and most imaginative.

## Solution
![High level overview](high-level-overview.png)

Simple, right?

Never made an Alexa skill and haven't touched Ethereum or neural networks in a good couple of years, so why not do the obvious thing and combine them all? The pieces themselves are actually fairly straight forward, but putting this may well be the first time these three technologies have been put together for one use case, and it's got to be the dumbest way to utilise all three.

An explanation of the neural net can be seen [here](src/addition_rnn.html) (although I recommend checking out the [jupyter notebook](src/addition_rnn.ipynb) instead if you want to have a play), the Ethereum contract which calls the API can be seen [here](src/truffle/contracts/Adder.sol), and the Alexa skill lambda can be seen [here](src/skill/lambda/lambda_function.py).

*Note: Unfortunately I wasn't properly able to get the Ethereum part working due to dodgy versioning and library documentation (I remember why I stopped bothering with blockchain dev in the first place!), so I didn't bother to integrate web3 into the lambda, but the contract can deploy and run on a blockchain!*
