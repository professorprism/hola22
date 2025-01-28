
// Barrett Koster 2025
// Coke Machine 
// We have a grid of 'cokes' (just the letter 'C', say)
// and we pick one by row and column and then 'buy'
// it (the 'C' should disappear).

/* First of all, there is about half as much code here as
   in Boggle.  So if you started just trying to tweak Boggle,
   ok, but maybe it would be easier to just start over, use
   what you need here, leave the rest.  There's still a bit
   of code for this Coke Machine, but it is pretty much just
   lots parts, no weird state interactions (like Boggle).  

   When you get past the usual boiler plate and down to
   CMState, the key thing is to have the list of letters
   that represent the coke cans, all in a list.  Unlike in
   Boggle, this list is part of the STATE.  WHen you change
   a letter in the list, using setState() of course, the
   whole app will get rebuilt with the new letters.  So
   this is how you show cokes being there or gone.  

   The grid of 'cokes' is just a bunch of Boxes with the
   letters in them.  I had the 'for' loops to do it in the
   to of build(), before "return Scaffold ...", but it got
   really messy.  So I moved the code for this to functions
   that return the Column of Rows of letters that make up
   the grid.  I also put 
*/

import "package:flutter/material.dart";

void main()
{ runApp( CokeMachine() ); }

class CokeMachine extends StatelessWidget
{
  @override build( BuildContext context )
  { return MaterialApp
    ( title: "CokeMachine",
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

// box with border to show a letter
class Box extends StatelessWidget
{
  final String show;
  Box(this.show);

  Widget build( BuildContext context )
  { return  Container
    ( height: 50, width: 50,
      decoration: BoxDecoration 
      ( border: Border.all
        ( width:2, 
          color:  Color(0xff0000ff), 
        ),
      ),
      child: Text(show, style: TextStyle(fontSize: 40) ),
    );
  }
}
