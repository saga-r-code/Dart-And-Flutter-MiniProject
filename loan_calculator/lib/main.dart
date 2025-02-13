import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  String selected = '';
  double totalInterest = 0.0;
  double monthlyInterest = 0.0;
  double monthlyInstallment = 0.0;

  void loanCalculation() {
    final amount = int.parse(_controller1.text) - int.parse(_controller2.text);
    final interest =
        amount * (double.parse(_controller3.text) / 100) * int.parse(selected);
    final mintrest = interest / (int.parse(selected) * 12);
    final minstall = (amount + interest) / (int.parse(selected) * 12);
    setState(() {
      totalInterest = interest;
      monthlyInterest = mintrest;
      monthlyInstallment = minstall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.black,
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.amber,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Home Loan',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Calculator',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _inputField(
                  title: "Home Price",
                  hint: "e.g 1000000",
                  icon: Icons.home,
                  controller: _controller1,
                ),
                _inputField(
                  title: "Down Payment",
                  hint: "e.g 90000",
                  icon: Icons.payment,
                  controller: _controller2,
                ),
                _inputField(
                  title: "Interest Rate",
                  hint: "e.g 5",
                  icon: Icons.percent,
                  controller: _controller3,
                ),
                Text(
                  "Loan Term",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    _loanTerm("1"),
                    _loanTerm("2"),
                    _loanTerm("3"),
                    _loanTerm("4"),
                    _loanTerm("5"),
                  ],
                ),
                Row(
                  children: [
                    _loanTerm("6"),
                    _loanTerm("7"),
                    _loanTerm("8"),
                    _loanTerm("9"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    loanCalculation();
                    Future.delayed(Duration.zero);
                    showModalBottomSheet(
                        // isDismissible: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 400,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Loan Calculator",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                result(
                                    title: "Total Interest",
                                    amount: totalInterest),
                                result(
                                    title: "Monthly Interest",
                                    amount: monthlyInterest),
                                result(
                                    title: "Monthly Installment",
                                    amount: monthlyInstallment),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20, left: 20),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Recalculate",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget result({required String title, required double amount}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Text(
          "RM " + amount.toStringAsFixed(2),
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ),
    );
  }

  Widget _loanTerm(String title) {
    return GestureDetector(
      onTap: () {
        debugPrint(title);
        setState(() {
          selected = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 13, bottom: 10),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: title == selected
                ? Border.all(
                    width: 3, color: const Color.fromARGB(255, 154, 127, 21))
                : null,
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String title,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  icon,
                  color: const Color.fromARGB(255, 245, 192, 0),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
