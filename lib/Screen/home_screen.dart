import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonpress(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '=') {
      num2 = double.parse(output);

      switch (operand) {
        case '+':
          _output = (num1 + num2).toString();
          break;
        case '_':
          _output = (num1 - num2).toString();
          break;
        case '*':
          _output = (num1 * num2).toString();
          break;
        case '/':
          _output = (num1 / num2).toString();
          break;
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output += buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget button(String buttonText, Color buttonColor) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(24),
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
            onPressed: () {
              buttonpress(buttonText);
            },
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text(
          'Calculator App',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              output,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Divider(color: Colors.grey),
          const SizedBox(height: 25),

          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    button('7', Colors.grey[800]!),
                    button('8', Colors.grey[800]!),
                    button('9', Colors.grey[800]!),
                    button('/', Colors.black54),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    button('4', Colors.grey[800]!),
                    button('5', Colors.grey[800]!),
                    button('6', Colors.grey[800]!),
                    button('*', Colors.black54),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    button('1', Colors.grey[800]!),
                    button('2', Colors.grey[800]!),
                    button('3', Colors.grey[800]!),
                    button('-', Colors.black54),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    button('.', Colors.grey[800]!),
                    button('0', Colors.grey[800]!),
                    button('C', Colors.red[800]!),
                    button('+', Colors.black54),
                  ],
                ),

                const SizedBox(height: 15),
                Row(children: [button('=', Colors.black)]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
