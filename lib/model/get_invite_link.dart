class AddTeamModel {
  bool? success;
  List<Data>? data;

  AddTeamModel({this.success, this.data});

  AddTeamModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? sportId;
  int? won;
  int? lost;
  int? draw;

  Data({this.id, this.name, this.sportId, this.won, this.lost, this.draw});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sportId'];
    won = json['won'];
    lost = json['lost'];
    draw = json['draw'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sportId'] = this.sportId;
    data['won'] = this.won;
    data['lost'] = this.lost;
    data['draw'] = this.draw;
    return data;
  }
}


///different model for getting invite link
class GetInviteLink{
  String? message;
  String? inviteLink;
  GetInviteLink({this.message,this.inviteLink});

  GetInviteLink.fromJson(Map<String, dynamic> json){
    message = json['message'];
    inviteLink = json['inviteLink'];
  }

}
