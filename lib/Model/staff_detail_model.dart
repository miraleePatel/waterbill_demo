// ignore_for_file: unnecessary_this

class StaffDetailModel {
  int? status;
  String? message;
  List<Staff>? list;

  StaffDetailModel({this.status, this.message, this.list});

  StaffDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <Staff>[];
      json['List'].forEach((v) {
        list!.add(new Staff.fromJson(v));
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

class Staff {
  int? officerID;
  String? officerNo;
  int? branchID;
  String? municipality;
  int? departmentID;
  String? departmentName;
  String? officerFirstName;
  String? officerLastName;
  String? position;
  String? username;
  String? loginToken;
  String? phoneNumber;
  String? gender;

  Staff(
      {this.officerID,
        this.officerNo,
        this.branchID,
        this.municipality,
        this.departmentID,
        this.departmentName,
        this.officerFirstName,
        this.officerLastName,
        this.position,
        this.username,
        this.loginToken,
        this.phoneNumber,
        this.gender});

  Staff.fromJson(Map<String, dynamic> json) {
    officerID = json['OfficerID'];
    officerNo = json['OfficerNo'];
    branchID = json['BranchID'];
    municipality = json['Municipality'];
    departmentID = json['DepartmentID'];
    departmentName = json['DepartmentName'];
    officerFirstName = json['OfficerFirstName'];
    officerLastName = json['OfficerLastName'];
    position = json['Position'];
    username = json['Username'];
    loginToken = json['LoginToken'];
    phoneNumber = json['PhoneNumber'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OfficerID'] = this.officerID;
    data['OfficerNo'] = this.officerNo;
    data['BranchID'] = this.branchID;
    data['Municipality'] = this.municipality;
    data['DepartmentID'] = this.departmentID;
    data['DepartmentName'] = this.departmentName;
    data['OfficerFirstName'] = this.officerFirstName;
    data['OfficerLastName'] = this.officerLastName;
    data['Position'] = this.position;
    data['Username'] = this.username;
    data['LoginToken'] = this.loginToken;
    data['PhoneNumber'] = this.phoneNumber;
    data['Gender'] = this.gender;
    return data;
  }
}

