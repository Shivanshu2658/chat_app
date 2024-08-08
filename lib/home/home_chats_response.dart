class HomeChatResponse {
  bool? success;
  String? msg;
  List<String>? connectedUsers;

  HomeChatResponse({this.success, this.msg, this.connectedUsers});

  HomeChatResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    connectedUsers = json['connectedUsers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    data['connectedUsers'] = this.connectedUsers;
    return data;
  }
}
