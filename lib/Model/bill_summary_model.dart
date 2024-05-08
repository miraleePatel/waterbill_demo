class BillSummaryModel {
  int? status;
  String? message;
  List<BillSummary>? list;

  BillSummaryModel({this.status, this.message, this.list});

  BillSummaryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <BillSummary>[];
      json['List'].forEach((v) {
        list!.add(new BillSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.list != null) {
      data['List'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillSummary {
  String? monthName;
  int? year;
  int? previousWaterUnit;
  int? waterUnit;
  int? usedUnit;
  double? paymentAmount;
  double? carriedOver;
  double? carryOver;
  String? meterImage;
  String? statusTextEng;
  String? statusTextThai;

  BillSummary(
      {this.monthName,
        this.year,
        this.previousWaterUnit,
        this.waterUnit,
        this.usedUnit,
        this.paymentAmount,
        this.carriedOver,
        this.carryOver,
        this.meterImage,
        this.statusTextEng,
        this.statusTextThai});

  BillSummary.fromJson(Map<String, dynamic> json) {
    monthName = json['MonthName'];
    year = json['Year'];
    previousWaterUnit = json['PreviousWaterUnit'];
    waterUnit = json['WaterUnit'];
    usedUnit = json['UsedUnit'];
    paymentAmount = json['PaymentAmount'];
    carriedOver = json['CarriedOver'];
    carryOver = json['CarryOver'];
    meterImage = json['MeterImage'];
    statusTextEng = json['StatusTextEng'];
    statusTextThai = json['StatusTextThai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MonthName'] = this.monthName;
    data['Year'] = this.year;
    data['PreviousWaterUnit'] = this.previousWaterUnit;
    data['WaterUnit'] = this.waterUnit;
    data['UsedUnit'] = this.usedUnit;
    data['PaymentAmount'] = this.paymentAmount;
    data['CarriedOver'] = this.carriedOver;
    data['CarryOver'] = this.carryOver;
    data['MeterImage'] = this.meterImage;
    data['StatusTextEng'] = this.statusTextEng;
    data['StatusTextThai'] = this.statusTextThai;
    return data;
  }
}




/*class BillSummaryModel {
  int? status;
  String? message;
  List<BillSummary>? list;

  BillSummaryModel({this.status, this.message, this.list});

  BillSummaryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <BillSummary>[];
      json['List'].forEach((v) {
        list!.add(new BillSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.list != null) {
      data['List'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillSummary {
  String? monthName;
  int? year;
  int? previousWaterUnit;
  int? waterUnit;
  int? usedUnit;
  double? paymentAmount;
  double? carriedOver;
  double? carryOver;
  String? meterImage;

  BillSummary(
      {this.monthName,
        this.year,
        this.previousWaterUnit,
        this.waterUnit,
        this.usedUnit,
        this.paymentAmount,
        this.carriedOver,
        this.carryOver,
        this.meterImage});

  BillSummary.fromJson(Map<String, dynamic> json) {
    monthName = json['MonthName'];
    year = json['Year'];
    previousWaterUnit = json['PreviousWaterUnit'];
    waterUnit = json['WaterUnit'];
    usedUnit = json['UsedUnit'];
    paymentAmount = json['PaymentAmount'];
    carriedOver = json['CarriedOver'];
    carryOver = json['CarryOver'];
    meterImage = json['MeterImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MonthName'] = this.monthName;
    data['Year'] = this.year;
    data['PreviousWaterUnit'] = this.previousWaterUnit;
    data['WaterUnit'] = this.waterUnit;
    data['UsedUnit'] = this.usedUnit;
    data['PaymentAmount'] = this.paymentAmount;
    data['CarriedOver'] = this.carriedOver;
    data['CarryOver'] = this.carryOver;
    data['MeterImage'] = this.meterImage;
    return data;
  }
}*/
