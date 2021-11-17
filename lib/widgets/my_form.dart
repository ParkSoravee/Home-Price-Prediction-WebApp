import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/regression_model.dart';

class MyForm extends StatefulWidget {
  // final Function submit;
  const MyForm({Key? key}) : super(key: key);
  // const MyForm(this.submit, {Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final models = RegressionModel().items;
  final _form = GlobalKey<FormState>();
  final _yearFocusNode = FocusNode();
  var predictPrice = 0.0;

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    predictPrice = RegressionModel().calculateModel(models);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Home price prediction...'),
        content: Text(
          '${predictPrice.toInt()} \$',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              clearForm();
              Navigator.pop(context);
            },
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Okay'),
          ),
        ],
      ),
    );
  }

  void clearForm() {
    _form.currentState!.reset();
    _yearFocusNode.unfocus();
  }

  String? Function(String?)? validate(String title) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $title.';
      }
      if (double.tryParse(value) == null) {
        return 'Please enter a valid number.';
      }
      if (double.parse(value) < 0) {
        return 'Please enter a positive number.';
      }
    };
  }

  String? Function(String?)? validateNotEqualZero(String title) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $title.';
      }
      if (double.tryParse(value) == null) {
        return 'Please enter a valid number.';
      }
      if (double.parse(value) <= 0) {
        return 'Please enter a valid number.';
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[0].title,
              icon: Icon(CupertinoIcons.bed_double_fill),
              border: InputBorder.none,
              suffixText: models[0].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[0].setVal(double.parse(value));
            },
            validator: validate(models[0].title),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[1].title,
              icon: Icon(Icons.bathtub),
              border: InputBorder.none,
              suffixText: models[1].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[1].setVal(double.parse(value));
            },
            validator: validateNotEqualZero(models[1].title),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[2].title,
              icon: Icon(Icons.stairs_sharp),
              border: InputBorder.none,
              suffixText: models[2].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[2].setVal(double.parse(value));
            },
            validator: validateNotEqualZero(models[2].title),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[3].title,
              icon: Icon(CupertinoIcons.house),
              border: InputBorder.none,
              suffixText: models[3].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[3].setVal(double.parse(value));
            },
            validator: validateNotEqualZero(models[3].title),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[4].title,
              icon: Icon(Icons.square_foot),
              border: InputBorder.none,
              suffixText: models[4].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[4].setVal(double.parse(value));
            },
            validator: validate(models[4].title),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[5].title,
              icon: Icon(Icons.meeting_room_rounded),
              border: InputBorder.none,
              suffixText: models[5].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[5].setVal(double.parse(value));
            },
            validator: validate(models[5].title),
          ),
          TextFormField(
            focusNode: _yearFocusNode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[6].title,
              icon: Icon(CupertinoIcons.calendar),
              border: InputBorder.none,
              suffixText: models[6].unit,
            ),
            onSaved: (value) {
              if (value == null) return;
              models[6].setVal(2021 - double.parse(value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[6].title}.';
              }
              if (double.tryParse(value) == null) {
                return 'Please enter a valid number.';
              }
              if (2021 - double.parse(value) <= 0) {
                return 'Please enter a positive number.';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                _saveForm();
              },
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
