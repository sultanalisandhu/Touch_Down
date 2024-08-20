class GetCoachByLocationMOdel {
  String? status;
  Result? result;

  GetCoachByLocationMOdel({this.status, this.result});

  GetCoachByLocationMOdel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  bool? success;
  List<Coaches>? coaches;

  Result({this.success, this.coaches});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(new Coaches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coaches {
  String? id;
  String? userId;
  String? sportId;
  String? location;
  String? address;
  String? fee;
  String? groupFee;
  int? rating;
  Null? description;
  int? sessions;
  String? status;
  String? createdAt;
  String? updatedAt;
  Sport? sport;
  User? user;

  Coaches(
      {this.id,
        this.userId,
        this.sportId,
        this.location,
        this.address,
        this.fee,
        this.groupFee,
        this.rating,
        this.description,
        this.sessions,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.sport,
        this.user});

  Coaches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    sportId = json['sportId'];
    location = json['location'];
    address = json['address'];
    fee = json['fee'];
    groupFee = json['groupFee'];
    rating = json['rating'];
    description = json['description'];
    sessions = json['sessions'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['sportId'] = this.sportId;
    data['location'] = this.location;
    data['address'] = this.address;
    data['fee'] = this.fee;
    data['groupFee'] = this.groupFee;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['sessions'] = this.sessions;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Sport {
  String? id;
  String? name;
  String? avatar;
  Null? attributes;
  int? playerLimit;

  Sport({this.id, this.name, this.avatar, this.attributes, this.playerLimit});

  Sport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    attributes = json['attributes'];
    playerLimit = json['playerLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['attributes'] = this.attributes;
    data['playerLimit'] = this.playerLimit;
    return data;
  }
}

class User {
  String? avatar;
  String? email;
  String? name;
  String? role;
  String? id;
  bool? isActive;
  String? phone;

  User(
      {this.avatar,
        this.email,
        this.name,
        this.role,
        this.id,
        this.isActive,
        this.phone});

  User.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
    id = json['id'];
    isActive = json['isActive'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['phone'] = this.phone;
    return data;
  }
}
