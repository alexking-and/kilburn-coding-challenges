using System.Collections.Generic;

using challenge_5_easy_does_it.Enums;
using challenge_5_easy_does_it.Structs;

namespace challenge_5_easy_does_it.Classes
{
    public class Game
    {
        public BoardState boardState;
        public WinState winState;

        public Game(string boardFilePath) {
            boardState = BoardGenerator.FromFile(boardFilePath);
            winState = WinState.InProgress;
        }

        public void MakeMove(MoveDirection direction) {
            if (!IsMoveValid(direction)) return;

            switch (direction)
            {
                case MoveDirection.Up:
                    boardState.robotPos.y--;
                    break;
                case MoveDirection.Down:
                    boardState.robotPos.y++;
                    break;
                case MoveDirection.Left:
                    boardState.robotPos.x--;
                    break;
                case MoveDirection.Right:
                    boardState.robotPos.y--;
                    break;
                default:
                    break;
            }

            switch (boardState.board[boardState.robotPos.x][boardState.robotPos.y])
            {
                case TileType.Exit:
                    winState = WinState.Win;
                    break;
                case TileType.Mine:
                    winState = WinState.Lose;
                    break;
                default:
                    break;
            }
        }

        private bool IsMoveValid(MoveDirection direction) {
            int newX = boardState.robotPos.x;
            int newY = boardState.robotPos.y;
            int numColumns = boardState.board.Count;
            int numRows = boardState.board[0].Count;

            switch (direction)
            {
                case MoveDirection.Up: 
                    newY--;
                    return 0 <= newY && newY < numRows && boardState.board[newX][newY] != TileType.Wall;
                case MoveDirection.Down:
                    newY++;
                    return 0 <= newY && newY < numRows && boardState.board[newX][newY] != TileType.Wall;
                case MoveDirection.Left:
                    newX--;
                    return 0 <= newX && newX < numColumns && boardState.board[newX][newY] != TileType.Wall;
                case MoveDirection.Right:
                    newX++;
                    return 0 <= newX && newX < numColumns && boardState.board[newX][newY] != TileType.Wall;
                default:
                    return false;
            }
        }
    }
}
