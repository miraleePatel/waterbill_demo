class CutomerDetiailsModel {
  int? status;
  String? message;
  List<CutomerDetiail>? list;

  CutomerDetiailsModel({this.status, this.message, this.list});

  CutomerDetiailsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <CutomerDetiail>[];
      json['List'].forEach((v) {
        list!.add(new CutomerDetiail.fromJson(v));
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

class CutomerDetiail {
  int? houseResidentID;
  int? houseID;
  String? houseNo;
  int? userWaterID;
  String? userWaterNumber;
  String? cName;
  int? phoneNumber;
  String? cAddress;
  int? previousMonthunit;

  CutomerDetiail(
      {this.houseResidentID,
        this.houseID,
        this.houseNo,
        this.userWaterID,
        this.userWaterNumber,
        this.cName,
        this.phoneNumber,
        this.cAddress,
        this.previousMonthunit});

  CutomerDetiail.fromJson(Map<String, dynamic> json) {
    houseResidentID = json['HouseResidentID'];
    houseID = json['HouseID'];
    houseNo = json['HouseNo'];
    userWaterID = json['UserWaterID'];
    userWaterNumber = json['UserWaterNumber'];
    cName = json['CName'];
    phoneNumber = json['PhoneNumber'];
    cAddress = json['CAddress'];
    previousMonthunit = json['PreviousMonthunit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HouseResidentID'] = this.houseResidentID;
    data['HouseID'] = this.houseID;
    data['HouseNo'] = this.houseNo;
    data['UserWaterID'] = this.userWaterID;
    data['UserWaterNumber'] = this.userWaterNumber;
    data['CName'] = this.cName;
    data['PhoneNumber'] = this.phoneNumber;
    data['CAddress'] = this.cAddress;
    data['PreviousMonthunit'] = this.previousMonthunit;
    return data;
  }
}
