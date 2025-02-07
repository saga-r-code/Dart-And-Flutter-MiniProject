import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 27),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 400,
                  // color: Colors.amber,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg'),
                                fit: BoxFit.cover)),
                      )),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://sm.ign.com/ign_pk/cover/a/avatar-gen/avatar-generations_rpge.jpg'),
                          radius: 50,
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Madrid City Tour for Designers',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Discover the city like a local',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 129, 128, 128)),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rowIconText(
                    '20',
                    Icons.favorite_rounded,
                  ),
                  rowIconText(
                    '34',
                    Icons.upload,
                  ),
                  rowIconText(
                    '54',
                    Icons.message,
                  ),
                  rowIconText(
                    '43',
                    Icons.face,
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowIconText(
    String text,
    IconData icon,
  ) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          color: Colors.white,
        )
      ],
    );
  }
}
