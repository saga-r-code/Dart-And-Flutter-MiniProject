import 'package:first_chapter/widget/BottomSheetWidget.dart';
import 'package:first_chapter/widget/Button.dart';
import 'package:first_chapter/widget/ImageWidget.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

int selectedindex = 0;
PageController pageController = PageController();

// List<Widget> widgets = <Widget>[
//   Text('Home '),
//   Text('Share'),
//   Text('Settings '),
// ];

class _BottomnavigationState extends State<Bottomnavigation> {
  void onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PageView(
        controller: pageController,
        children: [
          BottomSheetWidget(),
          Imagewidget(),
          Button(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}
