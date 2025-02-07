import 'package:flutter/material.dart';

class Listgrid extends StatelessWidget {
  Listgrid({super.key});

  final List<Map<String, dynamic>> list = [
    {'name': 'Item 1', 'description': 'Description 1'},
    {'name': 'Item 2', 'description': 'Description 2'},
    {'name': 'Item 3', 'description': 'Description 3'},
    {'name': 'Item 4', 'description': 'Description 4'},
    {'name': 'Item 5', 'description': 'Description 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List And Grid'),
        backgroundColor: Colors.pinkAccent,
        elevation: 10,
      ),
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(
                  icon: Icon(Icons.grid_view),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () => print(list[index]['name']),
                        title: Text(list[index]['name']),
                        subtitle: Text(list[index]['description']),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: list.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              list[index]['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            Text(
                              list[index]['description'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
