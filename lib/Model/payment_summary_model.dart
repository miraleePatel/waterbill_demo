class PaymentSummaryModel {
  int? status;
  String? message;
  List<PaymentSummary>? list;

  PaymentSummaryModel({this.status, this.message, this.list});

  PaymentSummaryModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <PaymentSummary>[];
      json['List'].forEach((v) {
        list!.add(new PaymentSummary.fromJson(v));
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

class PaymentSummary {
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

  PaymentSummary(
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

  PaymentSummary.fromJson(Map<String, dynamic> json) {
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
