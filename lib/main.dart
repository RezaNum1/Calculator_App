import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final valueController = TextEditingController();

  List<String> numbers = [];
  double results = 0;
  void addValue(String numbs) {
    setState(() {
      numbers.add(numbs);
    });
    var concate = StringBuffer();
    numbers.forEach((item) {
      concate.write(item);
    });

    setState(() {
      valueController.text = concate.toString();
    });
  }

  void addAssignment(String assg) {
    var cek = numbers[numbers.length - 1];

    if (cek == '+' || cek == '-' || cek == 'x') {
      setState(() {
        numbers.removeAt(numbers.length - 1);
        numbers.add(assg);
      });
    } else {
      setState(() {
        numbers.add(assg);
      });
    }

    var concate = StringBuffer();
    numbers.forEach((item) {
      concate.write(item);
    });

    setState(() {
      valueController.text = concate.toString();
    });
  }

  void removeOne() {
    if (numbers.length == 0) {
      return;
    } else {
      setState(() {
        numbers.removeAt(numbers.length - 1);
      });
      var concate = StringBuffer();
      numbers.forEach((item) {
        concate.write(item);
      });

      setState(() {
        results = 0;
        valueController.text = concate.toString();
      });
    }
  }

  void removeAll() {
    if (numbers.length == 0) {
      return;
    } else {
      setState(() {
        numbers = [];
      });

      var concate = StringBuffer();
      numbers.forEach((item) {
        concate.write(item);
      });

      setState(() {
        results = 0;
        valueController.text = concate.toString();
      });
    }
  }

  void calc() {
    List<String> number = [];
    List<String> number2 = [];
    List<String> assign = [];

    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] == '+' ||
          numbers[i] == '-' ||
          numbers[i] == '/' ||
          numbers[i] == 'x') {
        setState(() {
          assign.add(numbers[i]);
          number2.add(number.join());
          number = [];
        });
      } else {
        if (i == numbers.length - 1) {
          setState(() {
            number.add(numbers[i]);
            number2.add(number.join());
            number = [];
          });
        } else {
          setState(() {
            number.add(numbers[i]);
          });
        }
      }
    }

    for (int i = 0; i < number2.length; i++) {
      if (number2[i] == number2[0]) {
        results = double.parse(number2[0]);
      } else if (number2[i] == number2[number2.length - 1]) {
        if (assign[assign.length - 1] == '+') {
          results += double.parse(number2[i]);
        } else if (assign[assign.length - 1] == '-') {
          results -= double.parse(number2[i]);
        } else if (assign[assign.length - 1] == 'x') {
          results *= double.parse(number2[i]);
        } else if (assign[assign.length - 1] == '/') {
          results /= double.parse(number2[i]);
        }
      } else {
        if (assign[i] == '+') {
          results += double.parse(number2[i]);
        } else if (assign[i] == '-') {
          results -= double.parse(number2[i]);
        } else if (assign[i] == 'x') {
          results *= double.parse(number2[i]);
        } else if (assign[i] == '/') {
          results /= double.parse(number2[i]);
        }
      }
    }

    print(assign);
    print(number2);
    setState(() {
      valueController.text = results.toString();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 2,
              child: TextField(
                controller: valueController,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '7';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '8';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '9';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      var assg = "+";
                      addAssignment(assg);
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '4';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '5';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '6';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      var assg = "-";
                      addAssignment(assg);
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '1';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '2';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '3';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    'X',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      var assg = "x";
                      addAssignment(assg);
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '<=',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onPressed: removeOne,
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    var one = '0';
                    setState(() {
                      addValue(one);
                    });
                  },
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: removeAll,
                ),
              ),
              Container(
                width: 85,
                height: 85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: FlatButton(
                  child: Text(
                    '/',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      var assg = "/";
                      addAssignment(assg);
                    });
                  },
                ),
              ),
              Container(
                child: Text("Test"),
              )
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor),
            ),
            child: FlatButton(
              child: Text(
                '=',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
              onPressed: calc,
            ),
          )
        ],
      ),
    );
  }
}
