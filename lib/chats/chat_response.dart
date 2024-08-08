class ChatResponse {
  bool? success;
  String? msg;
  List<Chats>? chats;

  ChatResponse({this.success, this.msg, this.chats});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    if (this.chats != null) {
      data['chats'] = this.chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  String? sId;
  String? senderReceiver;
  String? senderId;
  String? receiverId;
  String? message;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Chats(
      {this.sId,
        this.senderReceiver,
        this.senderId,
        this.receiverId,
        this.message,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Chats.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderReceiver = json['senderReceiver'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    message = json['message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['senderReceiver'] = this.senderReceiver;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
