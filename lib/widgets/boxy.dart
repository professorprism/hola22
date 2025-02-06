
import "package:flutter/material.dart";

class Boxy extends Padding
{
  final double width;
  final double height;
  final String letter;

  Boxy( this.width,this.height, this.letter ) 
  : super
    ( padding: EdgeInsets.all(4.0),
      child: Container
      ( width: width, height: height,
        decoration: BoxDecoration
        ( border: Border.all(), ),
        child: Text(letter, style: TextStyle(fontSize:20) ),
      ),
    );
}
