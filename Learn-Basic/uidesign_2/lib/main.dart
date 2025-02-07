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
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          'saga-r-code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/05/11/55/91/360_F_511559113_UTxNAE1EP40z1qZ8hIzGNrB0LwqwjruK.jpg'),
                            radius: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'saga-r-code',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'Flutter Developer',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                        ],
                      )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                profileDetails('180', 'Followers'),
                                SizedBox(
                                  width: 20,
                                ),
                                profileDetails('100', 'Posts'),
                                SizedBox(
                                  width: 20,
                                ),
                                profileDetails('230', 'Following')
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              letterSpacing: 1),
                                        ))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.blue,
                                ),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  // color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Container(
              height: 100,
              // color: Colors.blue,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s',
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.grey.shade600, width: 2),
                          color: const Color.fromARGB(255, 171, 171, 171),
                        ),
                      ),
                      Text('Category ${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                    ],
                  );
                },
              ),
            ),
            Container(
              height: 100,
              // color: Colors.green,
              decoration: BoxDecoration(),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                        side: BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        ['Email', 'Site', 'Phone'][index],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp')),
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(5),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Text('${index + 1}'),
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }

  Widget profileDetails(String value, title) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
