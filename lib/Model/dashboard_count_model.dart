class DashboardcountModel {
  int? status;
  String? message;
  List<Dashboardcount>? list;

  DashboardcountModel({this.status, this.message, this.list});

  DashboardcountModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <Dashboardcount>[];
      json['List'].forEach((v) {
        list!.add(new Dashboardcount.fromJson(v));
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

class Dashboardcount {
  int? totalHouse;
  int? billgenerate;
  int? billPercentage;

  Dashboardcount({this.totalHouse, this.billgenerate, this.billPercentage});

  Dashboardcount.fromJson(Map<String, dynamic> json) {
    totalHouse = json['TotalHouse'];
    billgenerate = json['Billgenerate'];
    billPercentage = json['BillPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalHouse'] = this.totalHouse;
    data['Billgenerate'] = this.billgenerate;
    data['BillPercentage'] = this.billPercentage;
    return data;
  }
}
