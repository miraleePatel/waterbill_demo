

class CustomerListModel {
  int? status;
  String? message;
  List<Customer>? list;

  CustomerListModel({this.status, this.message, this.list});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <Customer>[];
      json['List'].forEach((v) {
        list!.add(new Customer.fromJson(v));
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

class Customer {
  int? houseResidentID;
  String? cName;
  String? billNumber;
  String? userWaterID;
  String? branchID;
  String? userWaterNumber;
  String? houseID;
  String? houseNo;
  int? statusID;
  String? statusTextThai;
  String? statusTextEng;

  Customer(
      {this.houseResidentID,
        this.cName,
        this.billNumber,
        this.userWaterID,
        this.branchID,
        this.userWaterNumber,
        this.houseID,
        this.houseNo,
        this.statusID,
        this.statusTextThai,
        this.statusTextEng});

  Customer.fromJson(Map<String, dynamic> json) {
    houseResidentID = json['HouseResidentID'];
    cName = json['CName'];
    billNumber = json['BillNumber'];
    userWaterID = json['UserWaterID'];
    branchID = json['BranchID'];
    userWaterNumber = json['UserWaterNumber'];
    houseID = json['HouseID'];
    houseNo = json['HouseNo'];
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
    data['StatusID'] = this.statusID;
    data['StatusTextThai'] = this.statusTextThai;
    data['StatusTextEng'] = this.statusTextEng;
    return data;
  }
}


// class CustomerListModel {
//   int? status;
//   String? message;
//   List<Customer>? list;
//
//   CustomerListModel({this.status, this.message, this.list});
//
//   CustomerListModel.fromJson(Map<String, dynamic> json) {
//     status = json['Status'];
//     message = json['Message'];
//     if (json['List'] != null) {
//       list = <Customer>[];
//       json['List'].forEach((v) {
//         list!.add(Customer.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Status'] = this.status;
//     data['Message'] = this.message;
//     if (this.list != null) {
//       data['List'] = this.list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Customer {
//   int? userID;
//   String? cName;
//   String? billNumber;
//   String? userWaterNumber;
//   String? houseNo;
//
//   Customer(
//       {this.userID,
//         this.cName,
//         this.billNumber,
//         this.userWaterNumber,
//         this.houseNo});
//
//   Customer.fromJson(Map<String, dynamic> json) {
//     userID = json['UserID'];
//     cName = json['CName'];
//     billNumber = json['BillNumber'];
//     userWaterNumber = json['UserWaterNumber'];
//     houseNo = json['HouseNo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['UserID'] = this.userID;
//     data['CName'] = this.cName;
//     data['BillNumber'] = this.billNumber;
//     data['UserWaterNumber'] = this.userWaterNumber;
//     data['HouseNo'] = this.houseNo;
//     return data;
//   }
// }



///  23 - 3 before
// class CustomerListModel {
//   int? status;
//   String? message;
//   List<Customer>? list;
//
//   CustomerListModel({this.status, this.message, this.list});
//
//   CustomerListModel.fromJson(Map<String, dynamic> json) {
//     status = json['Status'];
//     message = json['Message'];
//     if (json['List'] != null) {
//       list = <Customer>[];
//       json['List'].forEach((v) {
//         list!.add(new Customer.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Status'] = this.status;
//     data['Message'] = this.message;
//     if (this.list != null) {
//       data['List'] = this.list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Customer {
//   int? houseResidentID;
//   String? cName;
//   String? billNumber;
//   String? userWaterID;
//   String? userWaterNumber;
//   String? houseID;
//   String? houseNo;
//
//   Customer(
//       {this.houseResidentID,
//         this.cName,
//         this.billNumber,
//         this.userWaterID,
//         this.userWaterNumber,
//         this.houseID,
//         this.houseNo});
//
//   Customer.fromJson(Map<String, dynamic> json) {
//     houseResidentID = json['HouseResidentID'];
//     cName = json['CName'];
//     billNumber = json['BillNumber'];
//     userWaterID = json['UserWaterID'];
//     userWaterNumber = json['UserWaterNumber'];
//     houseID = json['HouseID'];
//     houseNo = json['HouseNo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['HouseResidentID'] = this.houseResidentID;
//     data['CName'] = this.cName;
//     data['BillNumber'] = this.billNumber;
//     data['UserWaterID'] = this.userWaterID;
//     data['UserWaterNumber'] = this.userWaterNumber;
//     data['HouseID'] = this.houseID;
//     data['HouseNo'] = this.houseNo;
//     return data;
//   }
// }
