import 'package:flutter/material.dart';

void main() {
  // The entry point of the app. We are calling runApp to start the application.
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This is the root widget of the app, which is stateless and is responsible for setting up the app's theme.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The title of the app. This title appears in the app switcher and the app's header on some devices.
      title: 'Flutter Simple UI',
      // Define the app's theme, using a Material Design color swatch for the primary color.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // This is the default screen when the app starts, which is set to MyHomePage widget.
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // StatefulWidget because we need to update the UI when the user interacts with it.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Text controller to capture and manage the input text from the TextField
  final TextEditingController _controller = TextEditingController();

  // A string variable that will hold the message to be displayed
  String _message = '';

  // Function to update the message displayed on the screen
  void _updateMessage() {
    // Use setState to trigger a rebuild of the widget when the text changes
    setState(() {
      // Update the message with the text entered by the user
      _message = 'Hello , ${_controller.text}!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the App Abr of the app with a title
      appBar: AppBar(
        title: const Text('Simple UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // A Text widget to display the message
            const Text(
              'Enter Your userName:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your userName',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateMessage,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: const TextStyle(fontSize: 20.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

