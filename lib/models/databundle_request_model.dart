// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DataRequest dataFromJson(String str) => DataRequest.fromJson(json.decode(str));

String dataToJson(DataRequest data) => json.encode(data.toJson());

class DataRequest {
  DataRequest({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  String status;
  String message;
  int code;
  Data data;

  factory DataRequest.fromJson(Map<String, dynamic> json) => DataRequest(
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
    required this.extraData,
  });

  String statusCode;
  String transactionStatus;
  int transactionReference;
  String transactionMessage;
  int baxiReference;
  String providerMessage;
  ExtraData extraData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusCode: json["statusCode"],
        transactionStatus: json["transactionStatus"],
        transactionReference: json["transactionReference"],
        transactionMessage: json["transactionMessage"],
        baxiReference: json["baxiReference"],
        providerMessage: json["provider_message"],
        extraData: ExtraData.fromJson(json["extraData"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "transactionStatus": transactionStatus,
        "transactionReference": transactionReference,
        "transactionMessage": transactionMessage,
        "baxiReference": baxiReference,
        "provider_message": providerMessage,
        "extraData": extraData.toJson(),
      };
}

class ExtraData {
  ExtraData({
    required this.balance,
    required this.exchangeReference,
    required this.responseMessage,
    required this.status,
    required this.statusCode,
    required this.responseCode,
  });

  String balance;
  String exchangeReference;
  String responseMessage;
  String status;
  String statusCode;
  String responseCode;

  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
        balance: json["balance"],
        exchangeReference: json["exchangeReference"],
        responseMessage: json["responseMessage"],
        status: json["status"],
        statusCode: json["statusCode"],
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "exchangeReference": exchangeReference,
        "responseMessage": responseMessage,
        "status": status,
        "statusCode": statusCode,
        "responseCode": responseCode,
      };
}
