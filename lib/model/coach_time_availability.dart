class CoachTimeAvailability {
  String? status;
  Result? result;

  CoachTimeAvailability({this.status, this.result});

  CoachTimeAvailability.fromJson(Map<String, dynamic> json) {
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
  List<Slots>? slots;

  Result({this.success, this.slots});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  String? id;
  String? startTime;
  String? endTime;
  bool? isBooked;
  bool? isCanceled;
  String? availabilityId;
  String? formattedStartTime;

  Slots(
      {this.id,
        this.startTime,
        this.endTime,
        this.isBooked,
        this.isCanceled,
        this.availabilityId,
        this.formattedStartTime});

  Slots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isBooked = json['isBooked'];
    isCanceled = json['isCanceled'];
    availabilityId = json['availabilityId'];
    formattedStartTime = json['formattedStartTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['isBooked'] = this.isBooked;
    data['isCanceled'] = this.isCanceled;
    data['availabilityId'] = this.availabilityId;
    data['formattedStartTime'] = this.formattedStartTime;
    return data;
  }
}
