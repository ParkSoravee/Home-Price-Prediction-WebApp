import 'package:house_price_prediction/models/userInput_model.dart';

class VariableModel {
  final String varName;
  final double coef;
  final String title;
  final String unit;
  double val;

  VariableModel({
    required this.varName,
    required this.coef,
    required this.title,
    required this.unit,
    this.val = 0.0,
  });

  void setVal(double newVal) {
    val = newVal;
  }
}

class RegressionModel {
  final _models = [
    VariableModel(
      varName: "bedroom",
      coef: 1,
      title: "Bedrooms",
      unit: "ห้อง",
    ),
    VariableModel(
      varName: "bathroom",
      coef: 2,
      title: "Bathrooms",
      unit: "ห้อง",
    ),
    VariableModel(
      varName: "floor",
      coef: 4,
      title: "Floors",
      unit: "ชั้น",
    ),
    VariableModel(
      varName: "sqft_living",
      coef: 3,
      title: "พื้นที่บริเวณบ้าน",
      unit: "ตารางฟุต",
    ),
    VariableModel(
      varName: "sqft_above",
      coef: 5,
      title: "พื้นที่ดาดฟ้า",
      unit: "ตารางฟุต",
    ),
    VariableModel(
      varName: "sqft_basement",
      coef: 6,
      title: "พื้นที่ห้องใต้ดิน",
      unit: "ตารางฟุต",
    ),
    VariableModel(
      varName: "yr_old",
      coef: 7,
      title: "ปีที่สร้าง",
      unit: "ค.ศ.",
    ),
  ];
  final double _cons = -1.0;

  List<VariableModel> get items {
    return [..._models];
  }

  double get cons {
    return _cons;
  }

  double calculateModel(List<VariableModel> models) {
    var answer = 0.0;
    for (var i = 0; i < _models.length; i++) {
      answer += _models[i].coef * models[i].val;
      print('${_models[i].varName} : ${models[i].val}');
    }
    answer += _cons;
    // _printVal();
    return answer;
  }

  // void resetAllVal() {
  //   for (var i = 0; i < _models.length; i++) {
  //     _models[i].val = 0.0;
  //   }
  // }

  void _printVal() {
    for (var i = 0; i < _models.length; i++) {
      print('${_models[i].varName} : ${_models[i].val}');
    }
  }
}
