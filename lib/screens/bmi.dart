import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchContrller = TextEditingController();

  var result = "";

  var bgColor = Colors.amber;
  String imageRange = "assets/bm.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("BIM"),
      // ),
      body: Container(
        color: bgColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: Column(
              children: [
                Text(
                  "Body mass index",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Image.asset(
                    imageRange,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text("WT"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("ft"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inchContrller,
                  decoration: InputDecoration(
                      label: Text("inch"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {
                      /////// BMi Logic //////////
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchContrller.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinch = int.parse(inch);

                        /// total  1 fit 12 inch
                        var tInch = (ift * 12);

                        /// 1 inch = 2.54 centimitar /// 1 inch = 2.54
                        var tcm = tInch * 2.54;

                        /// Centimitar = mitar /100 ////
                        var tm = tcm / 100;
                        var bmi = iwt / (tm * tm);

                        var message = " ";

                        if (bmi > 25) {
                          message = "You are OverWeight ";
                          bgColor = Colors.red;
                          imageRange = "assets/motu.png";
                          setState(() {
                            print("$message , $bgColor");
                          });
                        } else if (bmi < 18.5) {
                          message = "You are underweight ";
                          bgColor = Colors.green;
                          imageRange = "assets/underweights.png";

                          setState(() {
                            print("$message , $bgColor");
                          });
                        } else {
                          message = "Your Are  Healthy Weight ";
                          bgColor = Colors.yellow;
                          imageRange = "assets/healthy.png";

                          setState(() {
                            print("$message , $bgColor $imageRange");
                          });
                        }
                        setState(() {
                          result =
                              " $message \n Your BMI = ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Pleace Enter Your Details ";
                        });
                      }
                    },
                    child: Text(
                      "Check BMI",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$result",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
