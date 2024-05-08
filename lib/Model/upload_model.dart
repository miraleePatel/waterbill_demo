class UploadDocumentModel {
  String? message;
  String? files;

  UploadDocumentModel({this.message, this.files});

  UploadDocumentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['files'] = files;
    return data;
  }
}
