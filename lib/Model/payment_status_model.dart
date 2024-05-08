class PaymentstatusModel {
  int? status;
  String? message;
  List<Paymentstatus>? list;

  PaymentstatusModel({this.status, this.message, this.list});

  PaymentstatusModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['List'] != null) {
      list = <Paymentstatus>[];
      json['List'].forEach((v) {
        list!.add(new Paymentstatus.fromJson(v));
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

class Paymentstatus {
  int? statusID;
  String? statusTextEng;
  String? statusTextThai;

  Paymentstatus({this.statusID, this.statusTextEng, this.statusTextThai});

  Paymentstatus.fromJson(Map<String, dynamic> json) {
    statusID = json['StatusID'];
    statusTextEng = json['StatusTextEng'];
    statusTextThai = json['StatusTextThai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusID'] = this.statusID;
    data['StatusTextEng'] = this.statusTextEng;
    data['StatusTextThai'] = this.statusTextThai;
    return data;
  }
}
