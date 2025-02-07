import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(221, 44, 44, 44),
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Colors.blue,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiKjJqnD2WduVhERhI3w8lAIiKzrr6oUUDnA&s',)
                      ),SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sagar Shah',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            'shah.sagar2006@gmail.com',
                            style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 222, 220, 220)),
                          )
                        ])
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white)),
              ),
               ListTile(
                leading: Icon(Icons.folder, color: Colors.white),
                title: Text('Folder', style: TextStyle(color: Colors.white)),
              ),
               ListTile(
                leading: Icon(Icons.save, color: Colors.white),
                title: Text('Save', style: TextStyle(color: Colors.white)),
              ),
               ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.white),
                title: Text('Trash', style: TextStyle(color: Colors.white)),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Drawer Widget'),
      ),
      body: Container(
        child: Center(
          child: Text('Heyy Broo'),
        ),
      ),
    );
  }
}