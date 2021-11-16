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
          ],
        ),
      ),
    );
  }
}
