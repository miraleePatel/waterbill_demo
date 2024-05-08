class PaymentDetailsModel {
  int? status;
  String? message;
  List<PaymentDetails>? list;

  PaymentDetailsModel({this.status, this.message, this.list});

  PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <PaymentDetails>[];
      json['List'].forEach((v) {
        list!.add(new PaymentDetails.fromJson(v));
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

class PaymentDetails {
  int? houseResidentID;
  String? username;
  int? phoneNumber;
  String? userWaterNumber;
  int? userWaterID;
  String? houseNo;
  int? houseID;
  String? monthyear;
  String? billNumber;
  double? paymentAmount;
  String? billingDate;
  String? duedate;
  String? receiptNumber;
  String? paymentMethod;
  double? amountPaid;
  String? paymentDate;
  String? address;

  PaymentDetails(
      {this.houseResidentID,
        this.username,
        this.phoneNumber,
        this.userWaterNumber,
        this.userWaterID,
        this.houseNo,
        this.houseID,
        this.monthyear,
        this.billNumber,
        this.paymentAmount,
        this.billingDate,
        this.duedate,
        this.receiptNumber,
        this.paymentMethod,
        this.amountPaid,
        this.paymentDate,
        this.address});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    houseResidentID = json['HouseResidentID'];
    username = json['Username'];
    phoneNumber = json['PhoneNumber'];
    userWaterNumber = json['UserWaterNumber'];
    userWaterID = json['UserWaterID'];
    houseNo = json['HouseNo'];
    houseID = json['HouseID'];
    monthyear = json['Monthyear'];
    billNumber = json['BillNumber'];
    paymentAmount = json['PaymentAmount'];
    billingDate = json['BillingDate'];
    duedate = json['Duedate'];
    receiptNumber = json['ReceiptNumber'];
    paymentMethod = json['PaymentMethod'];
    amountPaid = json['AmountPaid'];
    paymentDate = json['PaymentDate'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HouseResidentID'] = this.houseResidentID;
    data['Username'] = this.username;
    data['PhoneNumber'] = this.phoneNumber;
    data['UserWaterNumber'] = this.userWaterNumber;
    data['UserWaterID'] = this.userWaterID;
    data['HouseNo'] = this.houseNo;
    data['HouseID'] = this.houseID;
    data['Monthyear'] = this.monthyear;
    data['BillNumber'] = this.billNumber;
    data['PaymentAmount'] = this.paymentAmount;
    data['BillingDate'] = this.billingDate;
    data['Duedate'] = this.duedate;
    data['ReceiptNumber'] = this.receiptNumber;
    data['PaymentMethod'] = this.paymentMethod;
    data['AmountPaid'] = this.amountPaid;
    data['PaymentDate'] = this.paymentDate;
    data['Address'] = this.address;
    return data;
  }
}
