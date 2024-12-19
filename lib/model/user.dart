import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
    String name;
    String email;
    String address;

    User({
        required this.name,
        required this.email,
        required this.address,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
      
        name: json["name"],
        email: json["email"],
        address: json["address"],
       
    );

    Map<String, dynamic> toJson() => {
       
        "name": name,
        "email": email,
        "address": address,
       
    };
}