class RegisterResponse {
  bool? success;
  String? msg;
  String? error;

  RegisterResponse({this.success, this.msg, this.error});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    data['error'] = this.error;
    return data;
  }
}
