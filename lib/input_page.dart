import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuse_card.dart';
import 'data_card.dart';
import 'result_page.dart';

const ActiveCardColor = 0xFF1D1E33;
const InActiveCardColor = 0xFF111328;
var CurrentColor1 = InActiveCardColor;
var CurrentColor2 = InActiveCardColor;
int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (CurrentColor2 == ActiveCardColor) {
                          CurrentColor2 = InActiveCardColor;
                          CurrentColor1 = ActiveCardColor;
                        } else if (CurrentColor1 == InActiveCardColor) {
                          CurrentColor1 = ActiveCardColor;
                        } else {
                          CurrentColor1 = InActiveCardColor;
                        }
                      });
                    },
                    child: ReuseableCard(
                      colour: Color(CurrentColor1),
                      cardChild: Info_Card(
                        name: 'MALE',
                        ic: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (CurrentColor1 == ActiveCardColor) {
                          CurrentColor1 = InActiveCardColor;
                          CurrentColor2 = ActiveCardColor;
                        } else if (CurrentColor2 == InActiveCardColor) {
                          CurrentColor2 = ActiveCardColor;
                        } else {
                          CurrentColor2 = InActiveCardColor;
                        }
                      });
                    },
                    child: ReuseableCard(
                      colour: Color(CurrentColor2),
                      cardChild: Info_Card(
                        name: 'FEMALE',
                        ic: Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: Color(ActiveCardColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 230.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0XFF8D8E98),
                    onChanged: (double newVal) {
                      setState(() {
                        height = newVal.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: Color(ActiveCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.plus),
                              backgroundColor: Colors.white,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.minus),
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: Color(ActiveCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.plus),
                              backgroundColor: Colors.white,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.minus),
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (contex){
                return Screen2();
              }));
            },
            label: const Text(
              'SUMBIT',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
          ),
        ],
      ),
    );
  }
}
