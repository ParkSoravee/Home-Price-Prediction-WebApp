import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_price_prediction/regression_model.dart';

class CenterForm extends StatefulWidget {
  const CenterForm({Key? key}) : super(key: key);

  @override
  _CenterFormState createState() => _CenterFormState();
}

class _CenterFormState extends State<CenterForm> {
  final con = RegressionModel.con;

  var predictPrice = 0.0;
  var userInput = {
    "bedroom": 12312.123,
    "bathroom": 1.0,
    "sqft_living": 123123.123,
    "floor": 1.0,
    "sqft_above": 1.0,
    "sqft_basement": 212312.0,
    "yr_old": 1.0,
  };

  void resetValue() {
    setState(() {
      userInput = {
        "bedroom": 0,
        "bathroom": 0,
        "sqft_living": 0,
        "floor": 0,
        "sqft_above": 0,
        "sqft_basement": 0,
        "yr_old": 0,
      };
    });
  }

  void submit() {
    predictPrice = RegressionModel().calculateModel(userInput);
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
              Navigator.pop(context);
              resetValue();
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
              child: Text('Okay')),
        ],
      ),
    );
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
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Bedrooms',
                  icon: Icon(CupertinoIcons.bed_double_fill),
                  border: InputBorder.none,
                  suffixText: 'ห้อง',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Bathrooms',
                  icon: Icon(Icons.bathtub),
                  border: InputBorder.none,
                  suffixText: 'ห้อง',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Floors',
                  icon: Icon(Icons.stairs_sharp),
                  border: InputBorder.none,
                  suffixText: 'ชั้น',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'พื้นที่บริเวณบ้าน',
                  icon: Icon(CupertinoIcons.house),
                  border: InputBorder.none,
                  suffixText: 'ตารางฟุต',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'พื้นที่ดาดฟ้า',
                  icon: Icon(Icons.square_foot),
                  border: InputBorder.none,
                  suffixText: 'ตารางฟุต',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'พื้นที่ห้องใต้ดิน',
                  icon: Icon(Icons.meeting_room_rounded),
                  border: InputBorder.none,
                  suffixText: 'ตารางฟุต',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'ปีที่สร้าง',
                  icon: Icon(CupertinoIcons.calendar),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    submit();
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
        ),
      ),
    );
  }
}
