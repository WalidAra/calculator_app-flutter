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
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double total = 0;
  double tempTotal = 0;
  double num = 0;
  double temp = 0;
  int exp = 10;
  late String op;

  void equals() {
    if (op == '+') {
      setState(() {
        total = tempTotal + temp;
        temp = 0;
        tempTotal = 0;
      });
    } else if (op == '-') {
      setState(() {
        total = tempTotal - temp;
        temp = 0;
        tempTotal = 0;
      });
    } else if (op == 'x') {
      setState(() {
        total = tempTotal * temp;
        temp = 0;
        tempTotal = 0;
      });
    } else if (op == '/') {
      setState(() {
        total = tempTotal / temp;
        temp = 0;
        tempTotal = 0;
      });
    }
  }

  void add() {
    if (tempTotal == 0) {
      setState(() {
        tempTotal = total;
      });
    } else {
      setState(() {
        tempTotal = tempTotal + total;
      });
    }

    setState(() {
      op = '+';
    });
  }

  void sub() {
    if (tempTotal == 0) {
      setState(() {
        tempTotal = total;
      });
    } else {
      setState(() {
        tempTotal = tempTotal - total;
      });
    }

    setState(() {
      op = '-';
    });
  }

  void mul() {
    if (tempTotal == 0) {
      setState(() {
        tempTotal = total;
      });
    } else {
      setState(() {
        tempTotal = tempTotal - total;
      });
    }

    setState(() {
      op = 'x';
    });
  }

  void devide() {
    if (tempTotal == 0) {
      setState(() {
        tempTotal = total;
      });
    } else {
      setState(() {
        tempTotal = tempTotal - total;
      });
    }

    setState(() {
      op = '/';
    });
  }

  bool isOperator(String input) {
    switch (input) {
      case '+':
        return true;
      case '-':
        return true;
      case 'x':
        return true;
      case '/':
        return true;
      case '=':
        return true;
      default:
        return false;
    }
  }

  void input(String n) {
    if (isOperator(n)) {
      setState(() {
        temp = num;
        num = 0;
      });

      switch (n) {
        case '+':
          add();
          break;
        case '-':
          sub();
          break;
        case 'x':
          mul();
          break;
        case '/':
          devide();
          break;

        case '=':
          equals();
          break;
      }

      print("total $total");
    } else {
      if (double.parse(n) != 0 && num == 0) {
        setState(() {
          num = double.parse(n);
        });
      } else {
        setState(() {
          num = (num * exp) + double.parse(n);
        });
      }

      setState(() {
        total = num;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color(0xff131b23),
        ),
        child: Column(children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  total.toString(),
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        total = 0;
                        tempTotal = 0;
                        num = 0;
                        temp = 0;
                        op = '';
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff606161),
                      ),
                      child: Center(
                        child: Text(
                          "AC",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff606161),
                      ),
                      child: Center(
                        child: Text(
                          "DEL",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("/");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff005db2),
                      ),
                      child: Center(
                        child: Text(
                          "/",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("x");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff005db2),
                      ),
                      child: Center(
                        child: Text(
                          "x",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      input("7");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "7",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("8");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "8",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("9");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "9",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("-");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff005db2),
                      ),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      input("4");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("5");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("6");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "6",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("+");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff005db2),
                      ),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      input("1");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("2");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("3");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("=");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff005db2),
                      ),
                      child: Center(
                        child: Text(
                          "=",
                          style: TextStyle(
                            color: Color(0xff9d9fa1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      input("0");
                    },
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input(".");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xff26313c),
                      ),
                      child: Center(
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: Color(0xff28a5fb),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
