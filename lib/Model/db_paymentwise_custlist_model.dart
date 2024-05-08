class DBPaymentWiseCustListModel {
  int? status;
  String? message;
  List<DBPaymentwiseCustlist>? list;

  DBPaymentWiseCustListModel({this.status, this.message, this.list});

  DBPaymentWiseCustListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <DBPaymentwiseCustlist>[];
      json['List'].forEach((v) {
        list!.add(new DBPaymentwiseCustlist.fromJson(v));
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

class DBPaymentwiseCustlist {
  int? houseResidentID;
  String? cName;
  String? billNumber;
  String? userWaterID;
  String? branchID;
  String? userWaterNumber;
  String? houseID;
  String? houseNo;
  String? monthyear;
  String? statusID;
  String? statusTextThai;
  String? statusTextEng;

  DBPaymentwiseCustlist(
      {this.houseResidentID,
        this.cName,
        this.billNumber,
        this.userWaterID,
        this.branchID,
        this.userWaterNumber,
        this.houseID,
        this.houseNo,
        this.monthyear,
        this.statusID,
        this.statusTextThai,
        this.statusTextEng});

  DBPaymentwiseCustlist.fromJson(Map<String, dynamic> json) {
    houseResidentID = json['HouseResidentID'];
    cName = json['CName'];
    billNumber = json['BillNumber'];
    userWaterID = json['UserWaterID'];
    branchID = json['BranchID'];
    userWaterNumber = json['UserWaterNumber'];
    houseID = json['HouseID'];
    houseNo = json['HouseNo'];
    monthyear = json['Monthyear'];
    statusID = json['StatusID'];
    statusTextThai = json['StatusTextThai'];
    statusTextEng = json['StatusTextEng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HouseResidentID'] = this.houseResidentID;
    data['CName'] = this.cName;
    data['BillNumber'] = this.billNumber;
    data['UserWaterID'] = this.userWaterID;
    data['BranchID'] = this.branchID;
    data['UserWaterNumber'] = this.userWaterNumber;
    data['HouseID'] = this.houseID;
    data['HouseNo'] = this.houseNo;
    data['Monthyear'] = this.monthyear;
    data['StatusID'] = this.statusID;
    data['StatusTextThai'] = this.statusTextThai;
    data['StatusTextEng'] = this.statusTextEng;
    return data;
  }
}
