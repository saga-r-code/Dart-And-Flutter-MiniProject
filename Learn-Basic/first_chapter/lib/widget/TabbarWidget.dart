import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, //start form the 0 to 3 
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Whatsapp'),
          bottom: TabBar(
            // isScrollable: true,
            indicatorWeight: 5,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Colors.white,
            tabs: [
            Tab(icon: Icon(Icons.chat), text: 'Status'),
            Tab(icon: Icon(Icons.home), text: 'Chat'),
            Tab(icon: Icon(Icons.call), text: 'Call'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ]),
        ),
        body: TabBarView(children: [
          Container(
            child: Center(
              child: Text(
                'CHATS',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'STATUS',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'CALLS',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'SETTINGS',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
