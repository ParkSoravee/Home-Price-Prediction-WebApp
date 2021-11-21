import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/regression_model.dart';

enum Areamode {
  sqft,
  sqmt,
  sqinch,
  sqWah,
}

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
  Areamode _areaMode = Areamode.sqft;

  Widget areaButton() {
    var _modeText = '';
    if (_areaMode == Areamode.sqft) {
      _modeText = 'ตารางฟุต';
    } else if (_areaMode == Areamode.sqmt) {
      _modeText = 'ตารางเมตร';
    } else if (_areaMode == Areamode.sqWah) {
      _modeText = 'ตารางวา';
    } else if (_areaMode == Areamode.sqinch) {
      _modeText = 'ตารางนิ้ว';
    }
    return TextButton(
      onPressed: () {
        setState(() {
          if (_areaMode == Areamode.sqft) {
            _areaMode = Areamode.sqWah;
          } else if (_areaMode == Areamode.sqWah) {
            _areaMode = Areamode.sqmt;
          } else if (_areaMode == Areamode.sqmt) {
            _areaMode = Areamode.sqinch;
          } else if (_areaMode == Areamode.sqinch) {
            _areaMode = Areamode.sqft;
          }
        });
      },
      child: Text(_modeText),
    );
  }

  double toSqft(double value) {
    var _areaSqft = value;
    if (_areaMode != Areamode.sqft) {
      if (_areaMode == Areamode.sqmt) {
        _areaSqft *= 10.76391042;
      } else if (_areaMode == Areamode.sqWah) {
        _areaSqft *= 43.0;
      } else if (_areaMode == Areamode.sqinch) {
        _areaSqft /= 144.0;
      }
    }
    return _areaSqft;
  }

  void saveArea(VariableModel model, double value) {
    model.setVal(toSqft(value));
  }

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
        title: Text(
          predictPrice >= 3000
              ? 'Home price prediction...'
              : 'Something went wrong...',
        ),
        content: Text(
          predictPrice >= 3000
              ? '${predictPrice.toInt()} \$'
              : 'Please try enter another values.',
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
          // Bedrooms
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[0].title}.';
              }
              if (double.tryParse(value) == null ||
                  double.parse(value) % 1 != 0 ||
                  double.parse(value) < 1) {
                return 'Please enter a valid number of ${models[0].title}.';
              }
            },
          ),
          // Bathroom
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[1].title}.';
              }
              if (double.tryParse(value) == null ||
                  double.parse(value) % 0.5 != 0 ||
                  double.parse(value) < 1) {
                return 'Please enter a valid number of ${models[1].title}.';
              }
            },
          ),
          // Floor
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[2].title}.';
              }
              if (double.tryParse(value) == null ||
                  double.parse(value) % 0.5 != 0 ||
                  double.parse(value) < 1) {
                return 'Please enter a valid number of ${models[2].title}.';
              }
            },
          ),
          // Area Living
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[3].title,
              icon: Icon(CupertinoIcons.house),
              border: InputBorder.none,
              // suffixText: models[3].unit,
              suffix: areaButton(),
            ),
            onSaved: (value) {
              if (value == null) return;
              // models[3].setVal(double.parse(value));
              saveArea(models[3], double.parse(value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[3].title}.';
              }
              if (double.tryParse(value) == null || double.parse(value) < 1) {
                return 'Please enter a valid number of ${models[3].title}.';
              }
              if (toSqft(double.parse(value)) < 300) {
                return 'Area too little.';
              }
            },
          ),
          // Area above
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[4].title,
              icon: Icon(Icons.square_foot),
              border: InputBorder.none,
              // suffixText: models[4].unit,
              suffix: areaButton(),
            ),
            onSaved: (value) {
              if (value == null) return;
              // models[4].setVal(double.parse(value));
              saveArea(models[4], double.parse(value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[4].title}.';
              }
              if (double.tryParse(value) == null || double.parse(value) < 0) {
                return 'Please enter a valid number of ${models[4].title}.';
              }
              // if (toSqft(double.parse(value)) < 0) {
              //   return 'Area too little than the standard.';
              // }
            },
          ),
          // Area basement
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: models[5].title,
              icon: Icon(Icons.meeting_room_rounded),
              border: InputBorder.none,
              // suffixText: models[5].unit,
              suffix: areaButton(),
            ),
            onSaved: (value) {
              if (value == null) return;
              // models[5].setVal(double.parse(value));
              saveArea(models[5], double.parse(value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${models[5].title}.';
              }
              if (double.tryParse(value) == null || double.parse(value) < 0) {
                return 'Please enter a valid number of ${models[5].title}.';
              }
            },
          ),
          // Year build
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
              final yrOld = 2021 - double.parse(value);
              if (double.parse(value) < 1900) {
                return 'Year-build should not less than 1900.';
              }
              if (double.tryParse(value) == null ||
                  yrOld <= 0 ||
                  double.parse(value) % 1 != 0) {
                return 'Please enter a valid number of ${models[6].title}.';
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
