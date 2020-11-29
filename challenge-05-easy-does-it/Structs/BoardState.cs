using System.Collections.Generic;

using challenge_5_easy_does_it.Enums;

namespace challenge_5_easy_does_it.Structs
{
    public struct BoardState
    {
        public List<List<TileType>> board;
        public Coord robotPos;
    }
}
