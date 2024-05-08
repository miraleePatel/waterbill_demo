class CreateBillModel {
  int? status;
  String? message;
  String? saveMessage;

  CreateBillModel({this.status, this.message, this.saveMessage});

  CreateBillModel.fromJson(Map<String, dynamic> json) {
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