import 'dart:io';

import 'package:baxify/const/api_constants.dart';
import 'package:baxify/models/airtime_model.dart';
import 'package:http/http.dart' as http;

class AirtimeService {
  final Map<String, dynamic>? queryparam;
  //static var response;
  AirtimeService({this.queryparam});
  Future<AirtimeModel?> buyAirtime() async {
    var client = http.Client();
    var json;
    var uri = Uri(
        scheme: 'https',
        host: ApiConstants.apiBaseUrl,
        path: ApiConstants.airtimeRequest,
        queryParameters: queryparam ??
            {
              'phone': '089989898877',
              'amount': '200',
              'service_type': 'mtn',
              'plan': 'prepaid',
              'agentId': '207',
              'agentReference': 'ddkjd76herdfdhgs',
            });

    var response = await client.post(uri, headers: {
      HttpHeaders.authorizationHeader: ApiConstants.authorization,
      HttpHeaders.contentTypeHeader: ApiConstants.contentType
    });

    if (response.statusCode == 200) {
       json = response.body;
      print(json);
      return airtimeFromJson(json);
    }

    return airtimeFromJson(json);
  }
}
