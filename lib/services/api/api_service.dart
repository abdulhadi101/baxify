import 'dart:io';

import 'package:baxify/const/api_constants.dart';
import 'package:baxify/models/airtime_model.dart';
import 'package:baxify/models/databundle_model.dart';
import 'package:baxify/models/databundle_request_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Map<String, dynamic>? queryparam;
  static var response;
  //static var response;
  ApiService({this.queryparam});
  Future<AirtimeModel?> buyAirtime() async {
    var client = http.Client();
    var json;
    var uri = Uri(
        scheme: 'https',
        host: ApiConstants.apiBaseUrl,
        path: ApiConstants.airtimeRequest,
        queryParameters: queryparam ?? {});

    response = await client.post(uri, headers: {
      HttpHeaders.authorizationHeader: ApiConstants.authorization,
      HttpHeaders.contentTypeHeader: ApiConstants.contentType
    });

    if (response.statusCode == 200) {
      json = response.body;
      // print(json);
      return airtimeFromJson(json);
    } else {
      json = response.body;
      //print(json);
    }

    //return airtimeFromJson(json);
  }

  Future<DataRequest?> buyData() async {
    var client = http.Client();
    var json;
    var uri = Uri(
        scheme: 'https',
        host: ApiConstants.apiBaseUrl,
        path: ApiConstants.databundleRequest,
        queryParameters: queryparam ?? {});

    var response = await client.post(uri, headers: {
      HttpHeaders.authorizationHeader: ApiConstants.authorization,
      HttpHeaders.contentTypeHeader: ApiConstants.contentType
    });

    if (response.statusCode == 200) {
      json = response.body;
      print(json);
      return dataFromJson(json);
    } else {
      json = response.body;
      print(json);
    }

    return dataFromJson(json);
  }

  Future<DataBundle?> getDataBundles() async {
    var client = http.Client();
    var json;
    var uri = Uri(
        scheme: 'https',
        host: ApiConstants.apiBaseUrl,
        path: ApiConstants.databundle,
        queryParameters: queryparam ?? {});

    var response = await client.post(uri, headers: {
      HttpHeaders.authorizationHeader: ApiConstants.authorization,
      HttpHeaders.contentTypeHeader: ApiConstants.contentType
    });

    if (response.statusCode == 200) {
      json = response.body;
      print(json);
      return dataBundleFromJson(json);
    } else {
      json = response.body;
    }

    return dataBundleFromJson(json);
  }
}
