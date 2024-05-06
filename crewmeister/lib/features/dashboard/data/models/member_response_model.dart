
class MemberResponseModel {
  String? message;
  List<MemberPayload>? payload;

  MemberResponseModel({this.message, this.payload});

  MemberResponseModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["payload"] is List) {
      payload = json["payload"] == null ? null : (json["payload"] as List).map((e) => MemberPayload.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    if(payload != null) {
      data["payload"] = payload?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class MemberPayload {
  int? crewId;
  int? id;
  String? image;
  String? name;
  int? userId;

  MemberPayload({this.crewId, this.id, this.image, this.name, this.userId});

  MemberPayload.fromJson(Map<String, dynamic> json) {
    if(json["crewId"] is int) {
      crewId = json["crewId"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["userId"] is int) {
      userId = json["userId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["crewId"] = crewId;
    data["id"] = id;
    data["image"] = image;
    data["name"] = name;
    data["userId"] = userId;
    return data;
  }
}