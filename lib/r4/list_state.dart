// list_state.dart
// Barrett Koster  2025

// This holds the list of possible puzzles.

import "dart:io";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:path_provider/path_provider.dart";


class ListState
{
  List<String> puzzles;
  bool loaded;

  ListState(this.puzzles, this.loaded);
}

class ListCubit extends Cubit<ListState>
{
  ListCubit() : super( ListState([],false) )
  {
    // async call to get the list and then update()
    dirList();
  }

  void update (List<String> puzzles)
  { emit( ListState(puzzles,true) ); }

  
  void dirList() async
  { List<String> theList = [];

    await Future.delayed( const Duration(seconds:2) );

    Directory mainDir = await getApplicationDocumentsDirectory();
    String puzzlePath = "${mainDir.path}/puzzles";
    theList = await Directory(puzzlePath)
                    .list()
                    .map
                    ( (entry) 
                      => entry.path.split('/').last
                    ).toList();

    update(theList);
  }

}