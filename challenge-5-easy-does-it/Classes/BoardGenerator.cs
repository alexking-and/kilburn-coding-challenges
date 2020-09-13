using System.Collections.Generic;
using System.Threading.Tasks;
using System.Net.Http;
using System;

using challenge_5_easy_does_it.Enums;
using challenge_5_easy_does_it.Structs;

namespace challenge_5_easy_does_it.Classes
{
    public class BoardGenerator
    {
        public static async Task<BoardState> FromFile(string filePath, HttpClient httpClient)
        {
            Console.WriteLine("Pulling map from file...");

            string mapString = await httpClient.GetStringAsync(filePath);
            string[] lines = mapString.Split("\n");
            List<char[]> charLines = new List<char[]>();
            for (var i = 0; i < lines.Length - 1; i++)
            {
                charLines.Add(lines[i].ToCharArray());
            }

            List<List<TileType>> board = new List<List<TileType>>();
            Coord robotPos = new Coord();

            for (var i = 0; i < charLines[0].Length; i++)
            {
                List<TileType> column = new List<TileType>();
                for (var j = 0; j < charLines.Count; j++) {
                    switch (lines[j][i])
                    {
                        case '+':
                            column.Add(TileType.Wall);
                            break;
                        case 'E':
                            column.Add(TileType.Exit);
                            break;
                        case '^':
                            column.Add(TileType.Mine);
                            break;
                        case 'R':
                            column.Add(TileType.Empty);
                            robotPos.x = i;
                            robotPos.y = j;
                            break;
                        default:
                            column.Add(TileType.Empty);
                            break;
                    }
                }
                board.Add(column);
            }

            Console.WriteLine($"Board initialised with shape {board.Count}x{board[0].Count}");
            Console.WriteLine($"Initial robot position set to ({robotPos.x}, {robotPos.y})");

            return new BoardState {
                board = board,
                robotPos = robotPos
            };
        }
    }
}
