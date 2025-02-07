import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  // list of items to be displayed
  List<String> list = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title of the app bar
        title: Text(
          "Dismissible Widget",
          style: TextStyle(
            // bold font
            fontWeight: FontWeight.w700,
            // letter spacing
            letterSpacing: 1.5,
          ),
        ),
        // background color of the app bar
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        // number of items in the list
        itemCount: list.length,
        // builder function to create each item in the list
        itemBuilder: (context, index) {
          // get the item at the current index
          final item = list[index];
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            secondaryBackground: Container(
              color: Colors.green,
            ),
            // key for the dismissible widget
            key: Key(item),
            // child of the dismissible widget
            child: Card(
              // child of the card
              child: ListTile(
                // title of the list tile
                title: Text(
                  // get the item at the current index
                  item,
                  
                ),
              ),
            ),
            // on dismissed callback
            onDismissed: (direction) {
              // check the direction of the dismiss
              if (direction == DismissDirection.startToEnd) {
                // show a snackbar with the item text and red background
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    showCloseIcon: true,
                    behavior: SnackBarBehavior.floating,
                    // content of the snackbar
                    content: Text(item,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    // background color of the snackbar
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                // show a snackbar with the item text and green background
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    showCloseIcon: true,

                    behavior: SnackBarBehavior.floating,
                    // content of the snackbar
                    content: Text(item,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    // background color of the snackbar

                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
