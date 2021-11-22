import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDialog extends StatefulWidget {
  final double price;
  final Function clearForm;
  const MyDialog(this.price, this.clearForm, {Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  var isTH = false;

  double showPrice() {
    return isTH ? widget.price * 32.85 : widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.price >= 3000
            ? 'Home price prediction...'
            : 'Something went wrong...',
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.price >= 3000)
            InkWell(
              onTap: () {
                setState(() {
                  isTH = !isTH;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Text(
                  isTH ? '฿' : '\$',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          SizedBox(
            width: 3,
          ),
          Text(
            widget.price >= 3000
                // ? '${showPrice().toInt()}'
                ? NumberFormat.decimalPattern().format(showPrice().toInt())
                : 'Please try enter another values.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.clearForm();
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
    );
  }
}
