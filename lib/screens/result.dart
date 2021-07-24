import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      result.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'You are thin😔',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            onPressed: () {},
            title: 'Re-calculate',
          )
        ],
      ),
    );
  }
}
