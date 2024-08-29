class FetchReservationGrounds {
  String? status;
  Result? result;

  FetchReservationGrounds({this.status, this.result});

  FetchReservationGrounds.fromJson(Map<String, dynamic> json) {
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
  String? message;
  List<Data>? data;

  Result({this.success, this.message, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? groundId;
  String? startTime;
  String? endTime;
  String? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Ground? ground;

  Data(
      {this.id,
        this.groundId,
        this.startTime,
        this.endTime,
        this.userId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.ground});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groundId = json['groundId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    userId = json['userId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ground =
    json['ground'] != null ?  Ground.fromJson(json['ground']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groundId'] = this.groundId;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.ground != null) {
      data['ground'] = this.ground!.toJson();
    }
    return data;
  }
}

class Ground {
  String? id;
  String? agencyId;
  String? sportId;
  String? name;
  String? location;
  String? avatar;
  int? rating;
  String? createdAt;
  String? updatedAt;

  Ground(
      {this.id,
        this.agencyId,
        this.sportId,
        this.name,
        this.location,
        this.avatar,
        this.rating,
        this.createdAt,
        this.updatedAt});

  Ground.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agencyId'];
    sportId = json['sportId'];
    name = json['name'];
    location = json['location'];
    avatar = json['avatar'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agencyId'] = this.agencyId;
    data['sportId'] = this.sportId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['avatar'] = this.avatar;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
