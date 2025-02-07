import 'package:flutter/material.dart';

// Container And SizedBox
class ConatinerSized extends StatelessWidget {
  const ConatinerSized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Container And Sized Box '),
      ),
      body: Center(
        child: Container(
        // padding: EdgeInsets.all(20),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              // shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(20),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ]),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlue,
            ),
          ),
          // child: Center(
          //     child: Text(
          //   'Hello World',
          //   style: TextStyle(fontSize: 20),
          // )),
        ),
        // child: SizedBox(
        //   height: 50,
        //   width: 50,
        //   child: Text("Hello"),
        // ),
      ),
    );
  }
}
