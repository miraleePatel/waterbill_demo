class MonthYearListModel {
  int? status;
  String? message;
  List<MonthYearList>? list;

  MonthYearListModel({this.status, this.message, this.list});

  MonthYearListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <MonthYearList>[];
      json['List'].forEach((v) {
        list!.add(new MonthYearList.fromJson(v));
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

class MonthYearList {
  int? cMonth;
  String? cYear;
  String? name;

  MonthYearList({this.cMonth, this.cYear, this.name});

  MonthYearList.fromJson(Map<String, dynamic> json) {
    cMonth = json['CMonth'];
    cYear = json['CYear'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CMonth'] = this.cMonth;
    data['CYear'] = this.cYear;
    data['Name'] = this.name;
    return data;
  }
}
