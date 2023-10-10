class UserModel2 {
  String? id;
  String? createdAt;

  UserModel2({this.id, this.createdAt});

  UserModel2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}
