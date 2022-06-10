import 'dart:convert';

EnUs enUsFromJson(String str) => EnUs.fromJson(json.decode(str));

String enUsToJson(EnUs data) => json.encode(data.toJson());

class EnUs {
  EnUs({
    required this.home,
  });

  String home;

  factory EnUs.fromJson(Map<String, dynamic> json) => EnUs(
        home: json["Home"] == null ? null : json["Home"],
      );

  Map<String, dynamic> toJson() => {
        "Home": home == null ? null : home,
      };
}
