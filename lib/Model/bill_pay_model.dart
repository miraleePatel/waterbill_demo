class BillPayModel {
  int? status;
  String? message;
  String? saveMessage;

  BillPayModel({this.status, this.message, this.saveMessage});

  BillPayModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    saveMessage = json['SaveMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['SaveMessage'] = this.saveMessage;
    return data;
  }
}