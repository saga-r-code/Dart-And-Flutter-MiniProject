import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Widget'),
        backgroundColor: const Color.fromARGB(255, 196, 64, 64),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showMyDialog(context);
            },
            child: Text('Show Alert')),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          scrollable: true, // To make the dialog scrollable as per the content
          title: Text('Alert Dialog'),
          content: SingleChildScrollView(
            // To make the dialog scrollable
            child: ListBody(
              children: [
                Text('This is an alert dialog'),
                Text('Would you like to approve this message?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // To close the dialog
              },
              child: Text('Approve'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
              },
              child: Text('Disapprove'),
            ),
          ],
        );
      });
}
