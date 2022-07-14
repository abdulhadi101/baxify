// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AirtimeModel airtimeFromJson(String str) => AirtimeModel.fromJson(json.decode(str));

String airtimeToJson(AirtimeModel data) => json.encode(data.toJson());

class AirtimeModel {
  AirtimeModel({
  required  this.status,
  required  this.message,
  required  this.code,
  required  this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory AirtimeModel.fromJson(Map<String, dynamic> json) => AirtimeModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.statusCode,
    required this.transactionStatus,
    required this.transactionReference,
    required this.transactionMessage,
    required this.baxiReference,
    required this.providerMessage,
  });

  String statusCode;
  String transactionStatus;
  int transactionReference;
  String transactionMessage;
  int baxiReference;
  String providerMessage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusCode: json["statusCode"],
        transactionStatus: json["transactionStatus"],
        transactionReference: json["transactionReference"],
        transactionMessage: json["transactionMessage"],
        baxiReference: json["baxiReference"],
        providerMessage: json["provider_message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "transactionStatus": transactionStatus,
        "transactionReference": transactionReference,
        "transactionMessage": transactionMessage,
        "baxiReference": baxiReference,
        "provider_message": providerMessage,
      };
}
