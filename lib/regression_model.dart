class RegressionModel {
  static final models = [
    {
      "varName": "bedroom",
      "value": 1,
      "title": "Bedrooms",
      "unit": "ห้อง",
    },
    {
      "varName": "bathroom",
      "value": 2,
      "title": "Bathrooms",
      "unit": "ห้อง",
    },
    {
      "varName": "sqft_living",
      "value": 3,
      "title": "พื้นที่บริเวณบ้าน",
      "unit": "ตารางฟุต",
    },
    {
      "varName": "floor",
      "value": 4,
      "title": "Floors",
      "unit": "ชั้น",
    },
    {
      "varName": "sqft_above",
      "value": 5,
      "title": "พื้นที่ดาดฟ้า",
      "unit": "ตารางฟุต",
    },
    {
      "varName": "sqft_basement",
      "value": 6,
      "title": "พื้นที่ห้องใต้ดิน",
      "unit": "ตารางฟุต",
    },
    {
      "varName": "yr_old",
      "value": 7,
      "title": "อายุบ้าน",
      "unit": "ปี",
    },
  ];
  static const con = -1;

  double calculateModel(Map<String, double> userInput) {
    var answer = 0.0;
    for (var i = 0; i < models.length; i++) {
      answer +=
          (models[i]['value'] as double) * userInput[models[i]["varName"]]!;
    }
    answer += con;
    return answer;
  }
}
