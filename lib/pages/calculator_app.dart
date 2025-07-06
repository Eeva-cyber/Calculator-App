import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  //variable
  String _userInput = '';
  String _result = '';

  //methods
  void _handleButtonPress(String value) {
    setState(() {
      if (value == 'AC') {
        _userInput = '';
        _result = '';
      } else if (value == 'DEL') {
        if (_userInput.isNotEmpty) {
          _userInput = _userInput.substring(0, _userInput.length - 1);
        }
      } else if (value == '=') {
        // Here you would typically evaluate the expression
        // For simplicity, we just show the input as result
        _result = _userInput; // Replace with actual evaluation logic
      } else {
        _userInput += value;
      }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _userInput,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _result,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
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
              itemBuilder: (context, index) {
                String label = buttons[index];
                
                return GestureDetector(
                  onTap: () {
                    _handleButtonPress(label);
                  },
                  child: Container(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}