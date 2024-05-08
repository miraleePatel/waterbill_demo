class CustomerBillListModel {
  int? status;
  String? message;
  List<CustomerBill>? list;

  CustomerBillListModel({this.status, this.message, this.list});

  CustomerBillListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <CustomerBill>[];
      json['List'].forEach((v) {
        list!.add(new CustomerBill.fromJson(v));
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

class CustomerBill {
  int? houseResidentID;
  String? username;
  String? phoneNumber;
  int? userWaterID;
  String? userWaterNumber;
  int? houseID;
  String? houseNo;
  String? monthyear;
  String? billNumber;
  String? usedUnit;
  String? paymentAmount;
  int? carriedOver;
  int? carryOver;
  int? statusID;
  String? statusTextThai;
  String? statusTextEng;
  String? carrycount;

  CustomerBill(
      {this.houseResidentID,
        this.username,
        this.phoneNumber,
        this.userWaterID,
        this.userWaterNumber,
        this.houseID,
        this.houseNo,
        this.monthyear,
        this.billNumber,
        this.usedUnit,
        this.paymentAmount,
        this.carriedOver,
        this.carryOver,
        this.statusID,
        this.statusTextThai,
        this.statusTextEng,
        this.carrycount});

  CustomerBill.fromJson(Map<String, dynamic> json) {
    houseResidentID = json['HouseResidentID'];
    username = json['Username'];
    phoneNumber = json['PhoneNumber'];
    userWaterID = json['UserWaterID'];
    userWaterNumber = json['UserWaterNumber'];
    houseID = json['HouseID'];
    houseNo = json['HouseNo'];
    monthyear = json['Monthyear'];
    billNumber = json['BillNumber'];
    usedUnit = json['UsedUnit'];
    paymentAmount = json['PaymentAmount'];
    carriedOver = json['CarriedOver'];
    carryOver = json['CarryOver'];
    statusID = json['StatusID'];
    statusTextThai = json['StatusTextThai'];
    statusTextEng = json['StatusTextEng'];
    carrycount = json['Carrycount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HouseResidentID'] = this.houseResidentID;
    data['Username'] = this.username;
    data['PhoneNumber'] = this.phoneNumber;
    data['UserWaterID'] = this.userWaterID;
    data['UserWaterNumber'] = this.userWaterNumber;
    data['HouseID'] = this.houseID;
    data['HouseNo'] = this.houseNo;
    data['Monthyear'] = this.monthyear;
    data['BillNumber'] = this.billNumber;
    data['UsedUnit'] = this.usedUnit;
    data['PaymentAmount'] = this.paymentAmount;
    data['CarriedOver'] = this.carriedOver;
    data['CarryOver'] = this.carryOver;
    data['StatusID'] = this.statusID;
    data['StatusTextThai'] = this.statusTextThai;
    data['StatusTextEng'] = this.statusTextEng;
    data['Carrycount'] = this.carrycount;
    return data;
  }
}
