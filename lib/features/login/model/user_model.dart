// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.name,
        required this.surName,
    });

    String name;
    String surName;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        surName: json["surName"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surName": surName,
    };
}
