import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_price_prediction/widgets/my_form.dart';

class CenterForm extends StatefulWidget {
  const CenterForm({Key? key}) : super(key: key);

  @override
  _CenterFormState createState() => _CenterFormState();
}

class _CenterFormState extends State<CenterForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 30),
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
