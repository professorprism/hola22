// file_stuff_bloc.dart
// Barrett Koster
// This demos some basic file io in flutter.
// Uses BlocProvider for state.

import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:path_provider/path_provider.dart";
// cd to the project directory
// > flutter pub add path_provider

class BufState
{ String text = "empty so far";
  bool loaded = false;

  BufState( this.text, this.loaded );
}

class BufCubit extends Cubit<BufState>
{
  BufCubit() : super( BufState("empty so far", false) );

  void update(String s) { emit( BufState(s,true) ); }
}

void main() 
{ runApp( FileStuff () );
}

class FileStuff extends StatelessWidget
{
  FileStuff({super.key});

  Widget build( BuildContext context )
  { return MaterialApp
    ( title: "file stuff - barrett",
      home: BlocProvider<BufCubit>
      ( create: (context) => BufCubit(),
        child: BlocBuilder<BufCubit,BufState>
        ( builder: (context,state) => FileStuff2(),
        ),
      ),
    );
  }
}

class FileStuff2 extends StatelessWidget
{
  FileStuff2({super.key});

  @override
  Widget build( BuildContext context ) 
  { BufCubit bc = BlocProvider.of<BufCubit>(context);
    BufState bs = bc.state;

    // Future<String> contents = readFile();
    // writeFile("hi there");
    return Scaffold
    ( appBar: AppBar( title: Text("file stuff - barrett") ),
      body: Column
      ( children:
        [ FloatingActionButton
          ( onPressed: () async
            { String contents = await readFile(); 
              bc.update(contents);
            },
            child: Text("load"),
          ),
          bs.loaded
          ? Text(bs.text)
          : Text("not loaded yet"),
        ],
      ),
    );
  }

  Future<String> whereAmI() async
  {
    Directory mainDir = await getApplicationDocumentsDirectory();
    String mainDirPath = mainDir.path;
    // String mainDirPath = "/Users/bkoster/Documents/courses/USC/368/shared";
    print("mainDirPath is $mainDirPath");
    return mainDirPath;
  }
  
  Future<String> readFile() async
  { await Future.delayed( const Duration(seconds:2) ); // adds drama
    String myStuff = await whereAmI();
    String filePath = "$myStuff/stuff.txt";
    File fodder = File(filePath);
    String contents = fodder.readAsStringSync();
    print("-------------in readFile ...");
    print(contents);
    return contents;
  }

  Future<void> writeFile( String writeMe) async
  { String myStuff = await whereAmI();
    String filePath = "$myStuff/otherStuff.txt";
    File fodder = File(filePath);
    fodder.writeAsStringSync( writeMe );
  }
}