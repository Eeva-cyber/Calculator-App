import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  //variable
  int _firstNumber = 0;
  int _secondNumber = 0;
  int _firstAnswer = 0;

  //methods
  void _addition() {
    setState(() {
      _firstAnswer = _firstNumber + _secondNumber;
    });
  }

  void _subtraction() {
    setState(() {
      _firstAnswer = _firstNumber - _secondNumber;
    });
  }

  void _multiplication() {
    setState(() {
      _firstAnswer = _firstNumber * _secondNumber;
    });
  }

  void _division() {
    setState(() {
      if (_secondNumber != 0) {
        _firstAnswer = _firstNumber ~/ _secondNumber; // Integer division
      } else {
        _firstAnswer = 0; // Handle division by zero
      }
    });
  }

  void _clear() {
    setState(() {
      _firstNumber = 0;
      _secondNumber = 0;
      _firstAnswer = 0;
    });
  }

  final List<String> buttons = [
  'AC', '', '', 'DEL', 
  '7', '8', '9', '/',
  '4', '5', '6', 'x',
  '1', '2', '3', '-',
  '0', '.', '=', '+',
  ];

  //UIs
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 81, 99),
      /*
      appBar: AppBar(
        title: Text(
          "Calculator App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black
      ),
      */
      body: Column(
        children: [
          // display area
          Flexible(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              alignment: Alignment.bottomRight,
              color: const Color.fromARGB(255, 51, 81, 99),
              child: Text(
                '$_firstAnswer',
                style: TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // All buttons in a single grid
          SizedBox(
            height: 550, // Adjust height as needed for your layout
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1, // Makes all buttons square
              ),
              itemCount: buttons.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 90, 143, 150),
                ),
                margin: EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    buttons[index],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}