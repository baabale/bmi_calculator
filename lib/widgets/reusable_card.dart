import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final Widget? child;

  ReusableCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kActiveCardColour,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
