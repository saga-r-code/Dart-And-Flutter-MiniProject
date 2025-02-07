import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
              backgroundColor: Colors.white,
              content: Text(
                'This is a snackbar',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              action: SnackBarAction(
                label: 'Undo',
                textColor: Colors.blue,
                onPressed: () {
                  // Add your undo action here
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar); // To show the snackbar
          },
          child: Text('Show Snackbar'),
        ),
      ),
    );
  }
}
