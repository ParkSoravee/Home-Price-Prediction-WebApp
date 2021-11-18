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
      coef: -82687.870467,
      title: "Bedrooms",
      unit: "ห้อง",
    ),
    VariableModel(
      varName: "bathroom",
      coef: 69699.476130,
      title: "Bathrooms",
      unit: "ห้อง",
    ),
    VariableModel(
      varName: "floor",
      coef: 55738.325568,
      title: "Floors",
      unit: "ชั้น",
    ),
    VariableModel(
      varName: "sqft_living",
      coef: 213.936651,
      title: "พื้นที่บริเวณบ้าน",
      unit: "ตารางฟุต",
    ),
    VariableModel(
      varName: "sqft_above",
      coef: 111.623412,
      title: "พื้นที่ดาดฟ้า",
      unit: "ตารางฟุต",
    ),
    VariableModel(
      varName: "sqft_basement",
      coef: 102.313238,
      title: "พื้นที่ห้องใต้ดิน",
      unit: "ตารางฟุต",
    ),
    VariableModel(
      varName: "yr_old",
      coef: 3561.951189,
      title: "ปีที่สร้าง",
      unit: "ค.ศ.",
    ),
  ];
  final double _cons = -258646.998249;

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
      // print('${_models[i].varName} : ${models[i].val}'); // Debug
    }
    answer += _cons;
    return answer;
  }

  // void resetAllVal() {
  //   for (var i = 0; i < _models.length; i++) {
  //     _models[i].val = 0.0;
  //   }
  // }
}
