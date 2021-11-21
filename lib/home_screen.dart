import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_price_prediction/widgets/center_form.dart';
import 'package:house_price_prediction/widgets/title_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // const appBarSize = MediaQuery.of(context).size.height * 10 / 100;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleBar(),
            CenterForm(),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('close'),
                          ),
                        ],
                      )
                    ],
                    title: Text('Model'),
                    content: Text(
                      'price_prediction = -82687.870467 bedrooms + 69699.476130 bathrooms + 213.936651 sqft_living + 55738.325568 floors + 111.623412 sqft_above + 102.313238 sqft_basement + 3561.951189 yr_old - 258646.998249',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(
                  'Model ในการทำนายราคาบ้านสร้างขึ้นจากทฤษฎี Multiple Linear Regression\n(คลิกเพื่อดูสมการ Linear Regression)\nโครงงาน Smart home price prediction using Linear regression\nเป็นส่วนหนึ่งของรายวิชา 01076032 ELEMENTARY DIFFERENTIAL EQUATIONS AND LINEAR ALGEBRA',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
