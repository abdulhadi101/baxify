// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DataBundle dataBundleFromJson(String str) =>
    DataBundle.fromJson(json.decode(str));

String dataBundleToJson(DataBundle data) => json.encode(data.toJson());

class DataBundle {
  DataBundle({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  String status;
  String message;
  int code;
  List<Datum> data;

  factory DataBundle.fromJson(Map<String, dynamic> json) => DataBundle(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.allowance,
    required this.price,
    required this.validity,
    required this.datacode,
  });

  String name;
  String allowance;
  int price;
  String validity;
  String datacode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        allowance: json["allowance"],
        price: json["price"],
        validity: json["validity"],
        datacode: json["datacode"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "allowance": allowance,
        "price": price,
        "validity": validity,
        "datacode": datacode,
      };
}
