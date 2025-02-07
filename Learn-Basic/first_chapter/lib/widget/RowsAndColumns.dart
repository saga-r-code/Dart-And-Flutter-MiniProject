import 'package:flutter/material.dart';

// Rows And Column
class RowsCols extends StatelessWidget {
  const RowsCols({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Rows And Cols ',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5), 
        ),
      ),
      body: Container(
        height:200,
        width: w,
        color: Colors.white,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center, 
          // mainAxisAlignment: MainAxisAlignment.spaceAround, //for row() and column()
          // crossAxisAlignment: CrossAxisAlignment.end, //for row() and col()
          children:[
            Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            ), 
            Container(
            height: 100,
            width: 100,
            color: Colors.red,
            ), 
            Container(
            height: 100,
            width: 100,
            color: Colors.green,
            ),
            Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
            ),
            // Text("lcccacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc", style: TextStyle(fontSize: 20, color: Colors.black),)
          ] 
        ),
      ),
    );
  }
}
