import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_price_prediction/models/regression_model.dart';
import 'package:house_price_prediction/models/userInput_model.dart';
import 'package:house_price_prediction/widgets/my_form.dart';

class CenterForm extends StatefulWidget {
  const CenterForm({Key? key}) : super(key: key);

  @override
  _CenterFormState createState() => _CenterFormState();
}

class _CenterFormState extends State<CenterForm> {
  // var predictPrice = 0.0;
  // var userInput = UserInputModel(
  //   bedroom: 12312.123,
  //   bathroom: 1.0,
  //   floor: 1.0,
  //   sqftLiving: 123123.123,
  //   sqftAbove: 1.0,
  //   sqftBasement: 212312.0,
  //   yrBuilt: 1,
  // );

  void resetValue() {
    setState(() {
      // userInput = UserInputModel(
      //   bedroom: 0,
      //   bathroom: 0,
      //   sqftLiving: 0,
      //   floor: 0,
      //   sqftAbove: 0,
      //   sqftBasement: 0,
      //   yrBuilt: 0,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        width: 400,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyForm(),
            ],
          ),
        ),
      ),
    );
  }
}
