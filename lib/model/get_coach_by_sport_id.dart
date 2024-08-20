// To parse this JSON data, do
//
//     final getCoachBySportIdModel = getCoachBySportIdModelFromJson(jsonString);

import 'dart:convert';

GetCoachBySportIdModel getCoachBySportIdModelFromJson(String str) => GetCoachBySportIdModel.fromJson(json.decode(str));

String getCoachBySportIdModelToJson(GetCoachBySportIdModel data) => json.encode(data.toJson());

class GetCoachBySportIdModel {
  String? status;
  Result? result;

  GetCoachBySportIdModel({
    this.status,
    this.result,
  });

  factory GetCoachBySportIdModel.fromJson(Map<String, dynamic> json) => GetCoachBySportIdModel(
    status: json["status"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result?.toJson(),
  };
}

class Result {
  bool? success;
  List<Coach>? coaches;

  Result({
    this.success,
    this.coaches,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    success: json["success"],
    coaches: json["coaches"] == null ? [] : List<Coach>.from(json["coaches"]!.map((x) => Coach.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "coaches": coaches == null ? [] : List<dynamic>.from(coaches!.map((x) => x.toJson())),
  };
}

class Coach {
  String? id;
  String? userId;
  String? sportId;
  String? location;
  String? address;
  String? fee;
  String? groupFee;
  int? rating;
  String? description;
  int? sessions;
  String? adhaarCard;
  List<String>? certificate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Coach({
    this.id,
    this.userId,
    this.sportId,
    this.location,
    this.address,
    this.fee,
    this.groupFee,
    this.rating,
    this.description,
    this.sessions,
    this.adhaarCard,
    this.certificate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    id: json["id"],
    userId: json["userId"],
    sportId: json["sportId"],
    location: json["location"],
    address: json["address"],
    fee: json["fee"],
    groupFee: json["groupFee"],
    rating: json["rating"],
    description: json["description"],
    sessions: json["sessions"],
    adhaarCard: json["adhaarCard"],
    certificate: json["certificate"] == null ? [] : List<String>.from(json["certificate"]!.map((x) => x)),
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "sportId": sportId,
    "location": location,
    "address": address,
    "fee": fee,
    "groupFee": groupFee,
    "rating": rating,
    "description": description,
    "sessions": sessions,
    "adhaarCard": adhaarCard,
    "certificate": certificate == null ? [] : List<dynamic>.from(certificate!.map((x) => x)),
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "user": user?.toJson(),
  };
}

class User {
  String? avatar;
  String? email;
  String? name;
  String? role;
  String? id;
  bool? isActive;
  String? phone;

  User({
    this.avatar,
    this.email,
    this.name,
    this.role,
    this.id,
    this.isActive,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatar: json["avatar"],
    email: json["email"],
    name: json["name"],
    role: json["role"],
    id: json["id"],
    isActive: json["isActive"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "email": email,
    "name": name,
    "role": role,
    "id": id,
    "isActive": isActive,
    "phone": phone,
  };
}
