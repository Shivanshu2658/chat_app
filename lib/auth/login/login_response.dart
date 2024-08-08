class LoginResponse {
  bool? success;
  String? msg;
  String? token;

  LoginResponse({this.success, this.msg, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    data['token'] = this.token;
    return data;
  }
}
