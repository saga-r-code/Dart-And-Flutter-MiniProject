import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  // Function to handle form submission

  handleSubmit() {
    final isValid = _formKey.currentState!.validate(); //! for null safty
    if (isValid) {
      submitForm();
    } else {
      return;
    }
  }

  submitForm() {
    // Here you can call your API or do whatever you want with the form data
    print('Form submitted: First Name: $firstName, Last Name: $lastName, Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        shape: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
        backgroundColor: const Color.fromARGB(234, 37, 172, 7),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'eg. John',
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                  key: ValueKey('firstName'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'First Name is required';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    firstName = value.toString();
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'eg. Doe',
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                  key: ValueKey('lastname'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Last Name is required';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lastName = value.toString();
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'eg. xyz@gamil.com',
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Email is required';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'eg. xyz12345',
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 6) {
                      return 'Password is required and must be at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value.toString();
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text('Submit'),
                  onPressed: () {
                    handleSubmit();
                    Text('Form submitted: First Name: $firstName, Last Name: $lastName, Email: $email, Password: $password');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
