import 'package:flutter/material.dart';

class Dropdownwidget extends StatefulWidget {
  const Dropdownwidget({super.key});

  @override
  State<Dropdownwidget> createState() => _DropdownwidgetState();
}

class _DropdownwidgetState extends State<Dropdownwidget> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown List'),
        shape: Border(bottom: BorderSide(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              underline: Container(
                height: 0,
                color: Colors.white,
              ),
              
              value: dropdownValue,
              dropdownColor: const Color.fromARGB(255, 181, 178, 178),
              icon: Icon(Icons.arrow_drop_down),  
              isExpanded: true,
                elevation: 0,
                items: <String>[
                  'One',
                  'Two',
                  'Three',
                  'Four',
                  'Five',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
