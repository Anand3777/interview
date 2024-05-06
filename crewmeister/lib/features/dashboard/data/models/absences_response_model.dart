class AbsencesResponseModel {
  String? message;
  List<AbsencesPayload>? payload;

  AbsencesResponseModel({this.message, this.payload});

  AbsencesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["payload"] is List) {
      payload = json["payload"] == null
          ? null
          : (json["payload"] as List).map((e) => AbsencesPayload.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> tempData = <String, dynamic>{};
    tempData["message"] = message;
    if (payload != null) {
      tempData["payload"] = payload?.map((e) => e.toJson()).toList();
    }
    return tempData;
  }
}

class AbsencesPayload {
  dynamic admitterId;
  String? admitterNote;
  String? confirmedAt;
  String? createdAt;
  int? crewId;
  String? endDate;
  int? id;
  String? memberNote;
  String? rejectedAt;
  String? startDate;
  String? type;
  int? userId;
  bool isExpendable = false;

  AbsencesPayload(
      {this.admitterId,
      this.admitterNote,
      this.confirmedAt,
      this.createdAt,
      this.crewId,
      this.endDate,
      this.id,
      this.memberNote,
      this.rejectedAt,
      this.startDate,
      this.type,
      this.userId});

  AbsencesPayload.fromJson(Map<String, dynamic> json) {
    admitterId = json["admitterId"];
    if (json["admitterNote"] is String) {
      admitterNote = json["admitterNote"];
    }
    if (json["confirmedAt"] is String) {
      confirmedAt = json["confirmedAt"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["crewId"] is int) {
      crewId = json["crewId"];
    }
    if (json["endDate"] is String) {
      endDate = json["endDate"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["memberNote"] is String) {
      memberNote = json["memberNote"];
    }
    rejectedAt = json["rejectedAt"];
    if (json["startDate"] is String) {
      startDate = json["startDate"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["userId"] is int) {
      userId = json["userId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> tempData = <String, dynamic>{};
    tempData["admitterId"] = admitterId;
    tempData["admitterNote"] = admitterNote;
    tempData["confirmedAt"] = confirmedAt;
    tempData["createdAt"] = createdAt;
    tempData["crewId"] = crewId;
    tempData["endDate"] = endDate;
    tempData["id"] = id;
    tempData["memberNote"] = memberNote;
    tempData["rejectedAt"] = rejectedAt;
    tempData["startDate"] = startDate;
    tempData["type"] = type;
    tempData["userId"] = userId;
    return tempData;
  }
}
