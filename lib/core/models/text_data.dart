class TextData {
  String? text;
  int? id;

  TextData({this.text, this.id});

  TextData.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['id'] = this.id;
    return data;
  }
}
