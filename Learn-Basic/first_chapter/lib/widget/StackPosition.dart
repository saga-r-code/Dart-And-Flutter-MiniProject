import 'package:flutter/material.dart';

class StackPosition extends StatelessWidget {
  const StackPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stack Position'),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            )
          ],
        ));
  }
}
