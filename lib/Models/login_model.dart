import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final String? userToken;
    final String? id;
    final String? name;
    final String? mobile;
    final String? email;

    LoginModel({
        this.userToken,
        this.id,
        this.name,
        this.mobile,
        this.email,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userToken: json["user_token"],
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "user_token": userToken,
        "id": id,
        "name": name,
        "mobile": mobile,
        "email": email,
    };
}
