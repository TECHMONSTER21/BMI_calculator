import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.bmitext, required this.rangetext}) : super(key: key);
 final String bmitext;
 final String rangetext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Reusablecard(
              colour: Colors.white,
              childcard: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              onpress: () {},
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecard(
              colour: activecardbackgroundtheme,
              childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                     rangetext,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.purple
                      ),
                    ),
                    Text(
                      bmitext,
                      style: TextStyle(
                        color: Colors.blueGrey,
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ]),
              onpress: () {},
            ),
          ),
          Reusablecard(
            onpress: () {
              Navigator.pop(context);
            },
            childcard: Text(
              'Re-Calculate',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
            colour: Colors.teal,
          ),
        ],
      ),
    );
  }
}
