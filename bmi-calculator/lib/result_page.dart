import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculator_brain.dart';
import 'custom_card.dart';

class ResultPage extends StatelessWidget {
  final CalculatorBrain brain;

  ResultPage({@required this.brain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    brain.getResult().toUpperCase(),
                    style: kLargeButtonTextStyle,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    brain.getBmiScore(),
                    style: kScoreTextStyle,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      brain.getExplanation(),
                      textAlign: TextAlign.center,
                      style: kExplanationTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
