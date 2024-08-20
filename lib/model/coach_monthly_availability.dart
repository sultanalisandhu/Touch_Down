class CoachMonthlyAvailability {
  String? status;
  Result? result;

  CoachMonthlyAvailability({this.status, this.result});

  CoachMonthlyAvailability.fromJson(Map<String, dynamic> json) {
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
  List<String>? availableDates;

  Result({this.success, this.availableDates});

  Result.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    availableDates = json['availableDates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['availableDates'] = this.availableDates;
    return data;
  }
}
