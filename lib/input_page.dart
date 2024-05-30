import 'package:bmi_calculayor/Constants.dart';
import 'package:bmi_calculayor/calculator_brain.dart%20';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'icon_content.dart';
import 'result_page.dart';
import 'reusablecard.dart';

const bottomcontainerheight = 80.0;
const activecardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // void updatecolour(Gender selectedgender) {
  //   if (selectedgender == Gender.Male) {
  //     if (maleCardColour == inactivecardcolor) {
  //       maleCardColour = activecardcolor;
  //       femaleCardColour = inactivecardcolor;
  //     } else {
  //       maleCardColour = inactivecardcolor;
  //     }
  //   }
  //   if (selectedgender == Gender.Female) {
  //     if (femaleCardColour == inactivecardcolor) {
  //       femaleCardColour = activecardcolor;
  //       maleCardColour = inactivecardcolor;
  //     } else {
  //       femaleCardColour = inactivecardcolor;
  //     }
  //   }
  // }
  Gender? selectedGender;
  int height = 120;
  int weight = 60;
  int Age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male
                        ? activecardcolor
                        : inactivecardcolor,
                    Cardchild: IconContent(
                      label: 'Male',
                      icon: Icons.male,
                    ),
                  )),
                  Expanded(
                      child: ResusableCard(
                          onpress: () {
                            setState(() {
                              selectedGender = Gender.Female;
                            });
                          },
                          colour: selectedGender == Gender.Female
                              ? activecardcolor
                              : inactivecardcolor,
                          Cardchild: IconContent(
                            label: 'Female',
                            icon: Icons.female,
                          ))),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33)),
                  margin: EdgeInsets.all(10),
                  width: 350,
                  height: 220,
                  child: Column(
                    children: [
                      Text(
                        "Height (in cm)",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newVaue) {
                              setState(() {
                                height = newVaue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ResusableCard(
                    colour: activecardcolor,
                    Cardchild: Column(
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        // Text(weight.toString()),
                        Row(
                          children: [
                            Expanded(
                              child: FloatingActionButton(
                                  backgroundColor: activecardcolor,
                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: FloatingActionButton(
                                  backgroundColor: activecardcolor,
                                  child: Icon(
                                    CupertinoIcons.add,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  }),
                            )
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  )),
                  Expanded(
                    child: ResusableCard(
                      colour: activecardcolor,
                      Cardchild: Column(
                        children: [
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            Age.toString(),
                            style: kNumberTextStyle,
                          ),
                          // Text(weight.toString()),
                          Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                    backgroundColor: activecardcolor,
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Age = Age - 1;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                    backgroundColor: activecardcolor,
                                    child: Icon(
                                      CupertinoIcons.add,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Age = Age + 1;
                                      });
                                    }),
                              )
                            ],
                          )
                        ],
                      ),
                      onpress: () {},
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              child: Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                // padding: EdgeInsets.only(bottom: 20),
                height: bottomcontainerheight,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Calculate",
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
