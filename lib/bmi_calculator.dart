import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  bool isMale = true;
  double height = 183;
  int weight = 73;
  int age = 30;
  double bmi = 0;

  double calculateBMI({
    required int weight,
    required double height,
  }) {
    return weight / ((height / 100) * (height / 100));
  }

  Color getBMIColor(double bmi){
    if (bmi <18.5){
      return Colors.blue;
    } else if (bmi <25){
      return Colors.green;
    } else if (bmi <30){
      return Colors.orange;
    } else {
      return Colors.red;
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        foregroundColor: kActiveTextColor,
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                // Male / Female selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                            isMale = true;
                          
                          var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: isMale
                              ? kSelectedTileBorderDecoration
                              : kTileBorderDecoration,
                          child: const Column(
                            children: [
                              Icon(
                                Icons.male,
                                size: 50,
                                color: kActiveTextColor,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: kActiveTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                            isMale = false;
                         
                          var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                        },
                        child: Container(
                          decoration: !isMale
                              ? kSelectedTileBorderDecoration
                              : kTileBorderDecoration,
                          padding: const EdgeInsets.all(20),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 50,
                                color: kActiveTextColor,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: kActiveTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 25),
      
                // Height
                Container(
                  decoration: kTileBorderDecoration,
                  child: Column(
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                          color: kActiveTextColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: const TextStyle(
                              color: kActiveTextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(color: kActiveTextColor),
                          ),
                        ],
                      ),
                      Slider(
                        min: 60,
                        max: 250,
                        value: height,
                        onChanged: (value) {
                            height = value;
                          
                          var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                        },
                        thumbColor: kButtonColor,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                ),
      
                const SizedBox(height: 25),
      
                // Weight and Age Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Weight
                    Expanded(
                      child: Container(
                        decoration: kTileBorderDecoration,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(color: kActiveTextColor),
                            ),
                            Text(
                              "$weight",
                              style: const TextStyle(
                                color: kActiveTextColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: kScaleButtonColor,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                      if (weight > 25) weight--;
                                   
                                    var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: kActiveTextColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: kScaleButtonColor,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                      if (weight < 250) weight++;
                                  
                                    var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: kActiveTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
      
                    const SizedBox(width: 5),
      
                    // Age
                    Expanded(
                      child: Container(
                        decoration: kTileBorderDecoration,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(
                                color: kActiveTextColor,
                              ),
                            ),
                            Text(
                              "$age",
                              style: const TextStyle(
                                color: kActiveTextColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: kScaleButtonColor,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                      if (age > 10) age--;
                                    
                                    var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: kActiveTextColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: kScaleButtonColor,
                                  shape: const CircleBorder(),
                                  onPressed: () {
                                      if (age < 100) age++;
                                    
                                    var bmiValue = calculateBMI(
                                      weight: weight, 
                                      height: height,
                                      );
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: kActiveTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 10),
      
          // BMI show Display
          Container(
            decoration: kTileBorderDecoration,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(
                    color: kActiveTextColor,
                  ),
                ),
                Text(
                  bmi.toStringAsFixed(1),
                  style: TextStyle(
                    color: getBMIColor(bmi),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),  
          ),
          const Spacer(),
      
         
        ],
      ),
    );
  }
}
