import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool result = false;
  int _currentStep = 0;

  List<Step> steps = [
    Step(
      title: Text("Order Placed"),
      content: Align(
          alignment: Alignment.centerLeft,
          child: Text("2025/2/20 10:00 PM Order Created !!")),
      isActive: true,
    ),
    Step(
      title: Text("Dispatch in Progress"),
      content: Align(
          alignment: Alignment.centerLeft,
          child: Text("2025/2/21 4:40 PM Parcel Ready for Dispatch !!")),
      isActive: true,
    ),
    Step(
      title: Text("Ready for Pickup"),
      content: Align(
          alignment: Alignment.centerLeft,
          child: Text("2025/2/22 09:10 AM Parcel Ready for Pickup !!")),
      isActive: true,
    ),
    Step(
      title: Text("In Transit"),
      content: Align(
          alignment: Alignment.centerLeft,
          child: Text("2025/2/23 06:30 AM Parcel Arrived At Destination !!")),
      isActive: true,
    ),
    Step(
      title: Text("Out for Delivery"),
      content: Align(
          alignment: Alignment.centerLeft,
          child: Text("2025/2/24 10:30 AM Parcel Out for Delivery !!")),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _content()),
    );
  }

  Widget _content() {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Image.network(
                    "https://img.freepik.com/free-vector/post-service-tracking-abstract-concept-vector-illustration-parcel-monitor-track-trace-your-shipment-package-tracking-number-express-delivery-online-shopping-mail-box-abstract-metaphor_335657-1777.jpg?t=st=1739381663~exp=1739385263~hmac=168188ef9381a1d123bde3aefb335e851fd9fef145c2ba2995781c640d0bce51&w=900",
                    height: 200,
                  ),
                  Text(
                    'Parcel Tracker',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
        body()
      ],
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Tracking Number: ",
            style: TextStyle(
                letterSpacing: 1, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Enter Tracking Number",
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    result = true;
                  });
                },
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    Text(
                      "Result:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () => setState(() => result = false),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(Icons.close, size: 25),
                        )),
                  ],
                ),
              )
            : SizedBox(
                height: 0,
              ),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  steps: steps,
                ),
              )
            : Align(
                alignment: Alignment.center,
                child: Image.network(
                  "https://img.freepik.com/free-psd/home-delivery-express-shipping-background-3d-render-illustration_47987-13641.jpg?t=st=1739473875~exp=1739477475~hmac=0c83df9ad20a9a24cf36b9969c29b0c678539fdf5ac50ba3cf41c26e0abd781e&w=996",
                  height: 200,
                ),
              )
      ],
    );
  }
}
