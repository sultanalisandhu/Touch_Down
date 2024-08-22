class UserDetailModel {
  String? status;
  Result? result;

  UserDetailModel({this.status, this.result});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
    json['result'] != null ?  Result.fromJson(json['result']) : null;
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
  User? user;

  Result({this.success, this.user});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? role;
  String? avatar;
  String? phone;
  Coach? coach;
  Player? player;
  Agency? agency;

  User(
      {this.id,
        this.name,
        this.email,
        this.role,
        this.avatar,
        this.phone,
        this.coach,
        this.player,
        this.agency});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    avatar = json['avatar'];
    phone = json['phone'];
    coach = json['coach'] != null ?  Coach.fromJson(json['coach']) : null;
    player = json['player'] != null ?  Player.fromJson(json['player']) : null;
    agency = json['agency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    data['player'] = this.player;
    data['agency'] = this.agency;
    return data;
  }
}

class Player {
  String? id;
  String? userId;
  String? sportId;
  int? matches;
  int? won;
  String? location;
  int? lost;
  int? draw;
  int? rating;
  String? createdAt;
  String? updatedAt;
  Sport? sport;

  Player(
      {this.id,
        this.userId,
        this.sportId,
        this.matches,
        this.won,
        this.location,
        this.lost,
        this.draw,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.sport
      });

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    sportId = json['sportId'];
    matches = json['matches'];
    won = json['won'];
    location = json['location'];
    lost = json['lost'];
    draw = json['draw'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sport = json['sport'] != null ?  Sport.fromJson(json['sport']) : null;
  }

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
  String? status;
  String? createdAt;
  String? updatedAt;
  Sport? sport;
  List<Availabilities>? availabilities;
  List<Reviews>? reviews;

  Coach(
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
        this.availabilities,
        this.reviews
      });

  Coach.fromJson(Map<String, dynamic> json) {
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
    if (json['availabilities'] != null) {
      availabilities = <Availabilities>[];
      json['availabilities'].forEach((v) {
        availabilities!.add(new Availabilities.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    if (this.availabilities != null) {
      data['availabilities'] =
          this.availabilities!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sport {
  String? id;
  String? name;
  String? avatar;
  String? attributes;
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
    return data;
  }
}

class Availabilities {
  String? id;
  String? coachId;
  String? date;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;

  Availabilities(
      {this.id,
        this.coachId,
        this.date,
        this.startTime,
        this.endTime,
        this.createdAt,
        this.updatedAt});

  Availabilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coachId = json['coachId'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coachId'] = this.coachId;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
class Reviews {
  String? id;
  String? userId;
  String? coachId;
  String? sessionId;
  int? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  User? user;

  Reviews(
      {this.id,
        this.userId,
        this.coachId,
        this.sessionId,
        this.rating,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    coachId = json['coachId'];
    sessionId = json['sessionId'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['coachId'] = this.coachId;
    data['sessionId'] = this.sessionId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
class Agency{}