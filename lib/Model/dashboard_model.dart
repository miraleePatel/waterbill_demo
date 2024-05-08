class DashboardModel {
  int? status;
  String? message;
  List<Dashboard>? list;

  DashboardModel({this.status, this.message, this.list});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <Dashboard>[];
      json['List'].forEach((v) {
        list!.add(new Dashboard.fromJson(v));
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

class Dashboard {
  int? unPaid;
  int? overdue;
  int? paid;

  Dashboard({this.unPaid, this.overdue, this.paid});

  Dashboard.fromJson(Map<String, dynamic> json) {
    unPaid = json['UnPaid'];
    overdue = json['Overdue'];
    paid = json['Paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UnPaid'] = this.unPaid;
    data['Overdue'] = this.overdue;
    data['Paid'] = this.paid;
    return data;
  }
}
