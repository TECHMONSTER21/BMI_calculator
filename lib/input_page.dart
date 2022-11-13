import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender? selectedgender;
  int height = 180;
  int weight = 35;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male
                          ? activecardbackgroundtheme
                          : inactivecardbackgroundtheme,
                      childcard: iconcontent(
                        whichicon: FontAwesomeIcons.mars,
                        label: 'Male',
                      )),
                ),
                Expanded(
                  child: Reusablecard(
                    onpress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? activecardbackgroundtheme
                        : inactivecardbackgroundtheme,
                    childcard: iconcontent(
                      whichicon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusablecard(
              onpress: (){},
              childcard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 28.0),
                      activeTrackColor: Colors.redAccent,
                      thumbColor: Colors.pink,
                    ),
                    child: Slider(
                        min: 120.0,
                        max: 220.0,
                        value: height.toDouble(),
                        onChanged: (double currentvalue) {
                          setState(() {
                            height = currentvalue.round();
                          });
                        }),
                  )
                ],
              ),
              colour: inactivecardbackgroundtheme,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Reusablecard(
                    onpress: (){},
                    childcard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(fontSize: 50.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(onPressed: (){
                              setState(() {
                                weight--;
                              });
                            }, icon: FontAwesomeIcons.minus),
                            SizedBox(width: 10.0,),
                            RoundIconButton(onPressed: (){
                              setState(() {
                                weight++;
                              });
                            }, icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                    colour: inactivecardbackgroundtheme,
                  ),
                ),
                Expanded(
                    child: Reusablecard(
                      onpress: (){},
                      colour: inactivecardbackgroundtheme,
                      childcard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(fontSize: 50.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }, icon: FontAwesomeIcons.minus),
                              SizedBox(width: 10.0,),
                              RoundIconButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }, icon: FontAwesomeIcons.plus)
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Reusablecard extends StatelessWidget {
  final Widget childcard;
  final Color colour;
  final VoidCallback onpress;
  Reusablecard({required this.colour, required this.childcard, required this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: childcard,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  RoundIconButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: Color(0XFFE9DEE1),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      shape: CircleBorder(),
    );
  }
}
