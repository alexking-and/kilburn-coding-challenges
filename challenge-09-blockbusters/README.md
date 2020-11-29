# Challenge 9 - Blockbusters

## Problem
Your task for this challenge is to create a working implementation of Tetris. 
You can tackle this challenge in whichever format, language, framework or engine you choose and the winner will be judged on a range of criteria including:
* Quality of code
* Quality of game play
* Any features which go above and beyond the basic expectations
## Idea
As a huge Tetris fan who was about to start playing around with game development anyway: BEST. CHALLENGE. EVER.

I have some big ideas of what to do, but I've never made a game before and haven't touched Unity or VR dev since playing around with it 6 years ago when the whole ecosystem was way more primitive; so, I'm going to work in iterations to make sure I have at least something done by the deadline:
1. Have a basic form of Tetris playable from a fixed location in VR - I consider a basic form of tetris to be pieces of four blocks (which can be rotated or moved left and right) which move down the screen, and when a line is completed, it is removed and blocks above are moved down. Anything else is extra and can be considered after the core gameplay is locked in.
2. Add locomotion (ability to move around space).
3. Make the board GINORMOUS and add crushing sound effects because I just like the idea of massive Tetris.
4. Control the pieces by physically dragging rather than by sticks & buttons.

## Solution
It's been a success! Although I had a couple of nightmares along the way, I've ended up with pretty much exactly what I was aiming for. Despite a few outstanding issues, I managed to hit even the goals I wasn't expecting to reach (utilising motion controls) and absolutely did enough to prove the concept!

A video demo can be seen [here](https://www.youtube.com/watch?v=0ctxnreJZAo), the Unity project can be seen [here](https://github.com/ObsidianEagle/vrtris), and the APK can be downloaded [here](https://github.com/ObsidianEagle/vrtris/releases/tag/milestone-1)

Things I've learnt:
- After a little practice, Unity is pretty nice to work with.
- I've spent most of the past year living in a Javascript dream world where I never encountered floating-point errors - it was driving me crazy trying to figure out why everything was breaking until I remembered.
- Since the Oculus Quest 2 is such a new device and Mac's don't seem to be the main expected platform for Unity, debugging on-device wasn't supported at all, which caused some frustration when trying to debug device-specific issues.
- I don't know if I'm going to continue with this or try something which won't result in a cease-and-desist from the Tetris company, but this has been a fun first step into game development.
