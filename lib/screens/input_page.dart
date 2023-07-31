import 'package:flutter/material.dart';
import 'results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/buttom_button.dart';
import '../components/round_icon_button.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          // Height card
          Expanded(
              child: Row(
            children: <Widget>[
              // Male card
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male
                    ? kActiveCardColour
                    : kInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              )),
              // Female card
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          // Height card
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(
                      context,
                    ).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Age and weight cards
          Expanded(
              child: Row(
            children: <Widget>[
              // Weight card
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Remove button
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        // Add button
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              // Age card
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Remove button
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        // Add button
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          // Calculate button
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
