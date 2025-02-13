import "package:flutter_bloc/flutter_bloc.dart";

class GameState
{ // board is a list of lists that represent a
  // Row of Columns of letters representing the board.
  // raster coordinates, from upper left.
  // The robot may not travel the entire rectangle.
  // 'w' is for wall.  "g" is for goal. These do not move
  // in a single puzzle, but we allow for loading new puzzles.
  // i.e., they are not hard wired like squares on a monopoly board.
  // 'r' is for robot's initial position and 'b' is box
  // initial position.  One more thing: 'c' is both box
  // and goal.  's' is robot on the goal ('r' and 'g')
  List<List<String>> board = [];

  // note that the columns and rows are interchanged from 
  // the way they appear here.
  GameState() 
  : board = 
    [ [ 'w','w','w','w','w','w','w'],
      [ 'w',' ','r',' ',' ',' ','w'],
      [ 'w',' ',' ',' ',' ',' ','w'],
      [ 'w',' ',' ',' ',' ',' ','w'],
      [ 'w',' ',' ','w','g',' ','w'],
      [ 'w',' ',' ',' ',' ',' ','w'],
      [ 'w',' ',' ',' ',' ',' ','w'],
      [ 'w',' ','b',' ',' ',' ','w'],
      [ 'w',' ',' ',' ',' ',' ','w'],
      [ 'w','w','w','w','w','w','w'],
    ]
  ;

  GameState.loaded( this.board );
}

class GameCubit extends Cubit<GameState>
{
  GameCubit() : super( GameState() );

  GameCubit.loaded( List<List<String>> gs ) : super( GameState.loaded(gs) );
}
