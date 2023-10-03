class UserInfoModel {
  late int id;
  late String fName;
  late String lName;
  late String email;
  late String phone;
  late String password;

  UserInfoModel(
      {required this.id,
        required this.fName,
        required this.lName,
        required this.email,
        required this.phone,
        required this.password,
      });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}