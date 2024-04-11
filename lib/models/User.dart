class User {
  int? id;
  String? name;
  String? address;
  String? gender;

  User({
    this.id,
    this.name,
    this.address,
    this.gender,
  });

  //mengkonversi json to object user
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    gender = json['gender'];
  }

//mengkonversi data object user to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['gender'] = gender;
    return data;
  }
}
