# Challenge 5 - Easy Does It

## Problem
Your task is write a miniature game. The player is in charge of a prototype robot AND-Roid, which is sent into an active minefield. The player's task is to direct the robot with up/down/left/right commands safely through the minefield to the exit, without striking any mines.

It's expected that your game will display the map and exit to the player, but obviously not the locations of the mines.

The winning solution (in any format/language) will be the one which is the best presented, with extra kudos given for going "above and beyond" the basic requirements.

### Map key
Character | Meaning
--- | ---
`R` | Robot start position
`+` | Wall (impassable)
`#` | Empty space (passable)
`^` | Mine
`E` | Exit

## Solution

I intended to do the next challenge in C#/.NET regardless since I wanted to bring myself up to speed on it for client work, but since this is clearly a front-end challenge, why not throw some new web technologies like Blazor and WebAssembly into the mix?

I was doing a lot out of my usual zone on this one, trying to learn C# and Blazor as well as attempting to utilise OOP paterns to separate logic and presentation, so I could only make this so sophisticated without spending too much time on it. However, I've got to say I was *really* impressed with Blazor and how quick it was to understand and get running. The .NET CLI tools skaffold a simple app with examples of how Blazor works, and the component model and the way the code works in general was really easy to pick up. I'm happy with how this one went!

If you have .NET Core installed, you can run using `dotnet run` and see the game in action at http://localhost:5000
