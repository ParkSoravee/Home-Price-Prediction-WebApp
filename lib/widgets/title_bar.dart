import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: double.infinity,
              child: FittedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5, bottom: 5),
                      child: Icon(
                        CupertinoIcons.house_alt_fill,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Smart Home Price Prediction',
                      style: TextStyle(
                        color: Colors.white,
                        height: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: double.infinity,
              child: FittedBox(
                child: Text(
                  'ERROR 404 x หัวกะทิ',
                  style: TextStyle(
                    color: Colors.white60,
                    height: 0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
