class UserModel2 {
  String? id;
  String? createdAt;

  UserModel2({this.id, this.createdAt});

  UserModel2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
