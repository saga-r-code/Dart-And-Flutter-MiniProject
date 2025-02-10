import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ));

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.black,
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.amber,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.info, size: 30, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(child: _body()),
    );
  }
}

Widget _body() {
  return Container(
    color: Colors.grey[200],
    child: Column(
      children: [
        Container(
          height: 170,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Home Loan',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _inputField(
                title: "Home Price",
                hint: "e.g 1000000",
                icon: Icons.home,
              ),
              _inputField(
                title: "Down Payment",
                hint: "e.g 90000",
                icon: Icons.payment,
              ),
              _inputField(
                title: "Interest Rate",
                hint: "e.g 5",
                icon: Icons.percent,
              ),
              Text(
                "Loan Term",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  _loanTerm("1"),
                  _loanTerm("2"),
                  _loanTerm("3"),
                  _loanTerm("4"),
                  _loanTerm("5"),
                ],
              ),
              Row(
                children: [
                  _loanTerm("6"),
                  _loanTerm("7"),
                  _loanTerm("8"),
                  _loanTerm("9"),
                ],
              ),
              SizedBox(
                height: 20),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3
                      ),
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _loanTerm(String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 13, bottom: 10),
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
         title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    ),
  );
}

Widget _inputField(
    {required String title, required String hint, required IconData icon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
          decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child:
                    Icon(icon, color: const Color.fromARGB(255, 245, 192, 0)),
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ),
      SizedBox(height: 20),
    ],
  );
}
