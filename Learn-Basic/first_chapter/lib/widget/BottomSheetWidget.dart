import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Widget',
            style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1)),
        backgroundColor: const Color.fromARGB(255, 48, 14, 54),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          showModalBottomSheet(
            elevation: 0,
            // isDismissible: false,
            // enableDrag: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(0)),
            ),
            backgroundColor: const Color.fromARGB(255, 71, 71, 71),
            context: context, builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Item 1'),
                  subtitle: Text('Subtitle 1'),
                  leading: Icon(Icons.home),

                ),
                ListTile(
                  title: Text('Item 2'),
                  subtitle: Text('Subtitle 2'),
                  leading: Icon(Icons.settings),
                ),
                ListTile(
                  title: Text('Item 3'),
                  subtitle: Text('Subtitle 3'),
                  leading: Icon(Icons.share),
                ),

              ],
            );
          });
        }, child: Text('Show Bottom Sheet',)),
      ),
    );
  }
}
