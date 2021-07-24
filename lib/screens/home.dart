import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 180;
  int weight = 65;
  int age = 20;

  Gender selectedGender = Gender.male;

  void _goToResultScreen() {
    // Todo: Calculate BMI RESULT
    double _result = weight / pow(height / 100, 2);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          result: _result,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selected: selectedGender == Gender.male ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selected: selectedGender == Gender.female ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kBottomContainerColour,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 16,
                      ),
                    ),
                    child: Slider(
                      value: height,
                      min: 10,
                      max: 310,
                      onChanged: (newVal) {
                        setState(() {
                          height = newVal;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              iconData: Icons.remove,
                              onPressed: () => setState(() => weight--),
                            ),
                            const SizedBox(width: 10),
                            RoundButton(
                              iconData: Icons.add,
                              onPressed: () => setState(() => weight++),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'yrs',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              iconData: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            RoundButton(
                              iconData: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(onPressed: _goToResultScreen),
        ],
      ),
    );
  }
}
