
// Barrett Koster 2025
// Coke Machine  redo in class
// We have a grid of 'cokes' (just the letter 'C', say)
// and we pick one by row and column and then 'buy'
// it (the 'C' should disappear).

import "package:flutter/material.dart";

void main()
{ runApp( CokeMachine() ); }

class CokeMachine extends StatelessWidget
{
  @override
  Widget build( BuildContext context )
  { return MaterialApp
    ( title: "Coke Machine in class",
      home: CMHome(),
    );
  }
}

class CMHome extends StatefulWidget
{
  @override
  State<CMHome> createState() => CMState();
}

class CMState extends State<CMHome>
{
  @override
  Widget build( BuildContext context )
  {
    return Scaffold
    ( appBar: AppBar( title: Text("Coke 2") ),
      body: Column  //Text("hi there "),
      ( children:
        [ makeGrid(),
          Box( "A" ), //Text("thing 1"),
          Box("B"), // Text("thing 2"),
        ],
      ),
    );
  }

  Column makeGrid()
  {  Column grid =  Column(children: []);
     for( int y=0; y<10; y++ )
     {  Row r = Row(children:[]);
        for ( int x=0; x<10; x++ )
        {
          r.children.add( Box("C") );
        }
        grid.children.add( r );
     }
     return grid;
  }
}

class Box extends StatelessWidget
{
  final String show;
  Box( this.show );

  @override
  Widget build ( BuildContext context )
  { return Container
    ( height: 50, width: 50,
      decoration: BoxDecoration
      ( border: Border.all
        ( width:2),
      ),
      child: Text(show, style: TextStyle(fontSize: 30) ),
    );
  }
}

/*

class CMState extends State<CMHome>
{
  // Here are the 'state' variables.
  // list of what is in the machine, 5 rows x 5 columns,
  // all in one list here.
  List<String> cokes = 
  ['C','C','C','C','C','C','C','C','C','C','C','C',
   'C','C','C','C','C','C','C','C','C','C','C','C','C',
  ];
  // which code the user is selecting
  int theRow=0;
  int theCol=0;

  Widget build( BuildContext context )
  { 
    print("CMHome.build ... starting ... ");

    return Scaffold
    ( appBar: AppBar( title: Text("Coke Machine") ),
      body: Column
      ( children:
        [ buildTheGrid(),  // grid of all the letters/cokes
          buildRowButtons(),  // buttons to select row
          buildColButtons(), // buttons to select column
          FloatingActionButton // 'buy' button
          ( onPressed: ()
            { setState
              ( ()
                { // calculate the location in the list based
                  // on theRow and theCol numbers.
                  int dex = theRow * 5 + theCol;
                  cokes[dex] = "x"; 
                }
              ); 
            },
            child: Text("buy"),
          ),
        ],
      ),
    );
  }

  // make and return the main grid of cokes 5x5.
  // Use whatever letters are in the 'cokes' list,
  // "C" if there, "x" presumably when taken.
  Column buildTheGrid()
  {
    Column theMachine = Column(children:[]);

    // top row: labels
    Row r = Row(children:[]);
    r.children.add(Box(" "));
    for ( int col=0; col<5; col++ )
    { r.children.add( Box("$col") ); }
    theMachine.children.add( r );

    // now fill in the cokes, 5 rows, 5 letters each
    int i=0;
    for (int row=0; row<5; row++ )
    { Row r = Row(children:[]);
      r.children.add( Box("$row") ); // row label
      for ( int col=0; col<5; col++ )
      {
        r.children.add( Box(cokes[i]) );
        i++;
      }
      theMachine.children.add( r );
    }
    return theMachine;
  }

  // make some buttons for user to select which row
  Row buildRowButtons()
  {
    Row rowButtons = Row( children: [] );
    rowButtons.children.add(Text("rows"));
    for ( int r=0; r<5; r++ )
    { rowButtons.children.add
      ( FloatingActionButton
        ( onPressed: (){ setState( () { theRow = r; } ); },
          child: Text("$r"),
        )
      );
    }
    rowButtons.children.add( Text("$theRow") );
    return rowButtons;
  }

  // make some buttons for user to select which column
  Row buildColButtons()
  {    
    Row colButtons = Row( children: [] );
    colButtons.children.add(Text("cols"));
    for ( int r=0; r<5; r++ )
    { colButtons.children.add
      ( FloatingActionButton
        ( onPressed: (){ setState( () { theCol = r; } ); },
          child: Text("$r"),
        )
      );
    }
    colButtons.children.add( Text("$theCol") );
    return colButtons;
  }
} // end class CMHome

*/