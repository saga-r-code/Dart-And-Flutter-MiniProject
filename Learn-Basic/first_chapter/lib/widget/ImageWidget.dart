import 'package:flutter/material.dart';

class Imagewidget extends StatelessWidget {
  const Imagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(66, 60, 60, 60),
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ],
              image: DecorationImage(
                image:
                 NetworkImage(
                  "https://onlinejpgtools.com/images/examples-onlinejpgtools/sunflower.jpg",
                ),
                fit: BoxFit.cover,
              ),
              // color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

