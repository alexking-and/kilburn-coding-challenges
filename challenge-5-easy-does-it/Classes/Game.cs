using System.Collections.Generic;
using System.Net.Http;

using challenge_5_easy_does_it.Enums;
using challenge_5_easy_does_it.Structs;

namespace challenge_5_easy_does_it.Classes
{
    public class Game
    {
        public BoardState boardState = new BoardState {
            board = new List<List<TileType>>(),
            robotPos = {
                x = -1,
                y = -1
            }
        };
        public WinState winState;
        private Coord initialPosition;

        public Game(string boardFilePath, HttpClient httpClient) {
            winState = WinState.InProgress;
            populateBoard(boardFilePath, httpClient);
        }

        public void ResetGame() {
            boardState.robotPos = initialPosition;
            winState = WinState.InProgress;
        }

        private async void populateBoard(string boardFilePath, HttpClient httpClient)
        {
            boardState = await BoardGenerator.FromFile(boardFilePath, httpClient);
            initialPosition = boardState.robotPos;
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
                    boardState.robotPos.x++;
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
            if (winState == WinState.Win || winState == WinState.Lose) return false;

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
