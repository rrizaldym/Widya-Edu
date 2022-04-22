// ignore_for_file: unnecessary_this

class InputJawaban {
  int? status;
  String? message;

  InputJawaban({this.status, this.message});

  InputJawaban.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
