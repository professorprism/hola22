import 'package:flutter/material.dart';


void main()
{ runApp(MyApp());
}

/*
class MyApp extends MaterialApp
{ MyApp()
  : super
    ( title: "Barry's hello",
      home: const MyHomePage(title: "B2 hello"),
    );
}
*/

/*
void main()
{ runApp
  ( MaterialApp
    ( title: "B3",
      home: const MyHomePage(title: "B4"),
    ),
  );
}
*/

class MyApp extends StatelessWidget
{ const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  { return MaterialApp
    ( title: 'Flutter Demo',
      theme: ThemeData
      ( colorScheme: ColorScheme.fromSeed
        (seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget
{ const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{ int _counter = 0; // This is why we need stateFUL.

  void _incrementCounter() 
  { setState
    ( () 
      {
         _counter++;
      }
    );
  }

  @override
  Widget build(BuildContext context)
  { // This method is rerun every time setState is called.
    return Scaffold
    ( appBar: AppBar
      ( backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center
      ( child: Column
        ( mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [ const Text
            ( 'You have pushed the button this many times:',
            ),
            Text
            ( '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
      ( onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
