import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainFormScreen extends StatefulWidget {
  @override
  _MainFormScreenState createState() => _MainFormScreenState();
}

class _MainFormScreenState extends State<MainFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(CupertinoIcons.house_alt_fill),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text('Smart Home Price Prediction')
      //     ],
      //   ),
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.house_alt_fill,
                      color: Colors.white,
                      size: 90,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Smart Home Price Prediction',
                      style: TextStyle(
                        fontSize: 90,
                        color: Colors.white,
                        height: 0.0,
                      ),
                    )
                  ],
                ),
                Text(
                  'ERROR 404 x หัวกะทิ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white60,
                    height: 0.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                            labelText: 'พื้นที่ใช้สอย',
                            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
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
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {},
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
