import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    final String? userToken;
    final int? id;
    final String? name;
    final String? mobile;
    final String? email;

    RegisterModel({
        this.userToken,
        this.id,
        this.name,
        this.mobile,
        this.email,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
