class UserData {
  String? name;
  String? passHash;
  String? id;

  UserData({this.name, this.passHash, this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    passHash = json['passHash'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['passHash'] = this.passHash;
    data['id'] = this.id;
    return data;
  }
}
