using System.Collections.Generic;

using challenge_5_easy_does_it.Enums;
using challenge_5_easy_does_it.Structs;

namespace challenge_5_easy_does_it.Classes
{
    public class BoardGenerator
    {
        public static BoardState FromFile(string filePath)
        {
            string[] lines = System.IO.File.ReadAllLines(filePath);

            List<List<TileType>> board = new List<List<TileType>>();
            Coord robotPos = new Coord();
            int colIndex = 0;
            int rowIndex = 0;
            foreach (string line in lines)
            {
                foreach (char c in line)
                {
                    switch (c)
                    {
                        case '+':
                            board[colIndex][rowIndex] = TileType.Wall;
                            break;
                        case 'E':
                            board[colIndex][rowIndex] = TileType.Exit;
                            break;
                        case '^':
                            board[colIndex][rowIndex] = TileType.Mine;
                            break;
                        case 'R':
                            board[colIndex][rowIndex] = TileType.Empty;
                            robotPos.x = colIndex;
                            robotPos.y = rowIndex;
                            break;
                        default:
                            board[colIndex][rowIndex] = TileType.Empty;
                            break;
                    }
                    colIndex++;
                }
                rowIndex++;
                colIndex = 0;
            }

            return new BoardState {
                board = board,
                robotPos = robotPos
            };
        }
    }
}
