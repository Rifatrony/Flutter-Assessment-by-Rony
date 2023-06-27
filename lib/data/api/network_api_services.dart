// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_assessment_test_rony/data/api/base_api_services.dart';
import 'package:flutter_assessment_test_rony/exception/app_exception.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    var uri = Uri.parse(url);

    try {
      final response = await http
          .get(
            uri,
          )
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", uri.toString());
    } on TimeoutException {
      APiNotRespondingException("Api not Responing", uri.toString());
    }

    return responseJson;
  }

  returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.body);
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(
            json.decode(response.body), response.request!.url.toString());

      case 401:
      case 403:
        throw UnAuthorizedException(
            json.decode(response.body), response.request!.url.toString());

      case 500:
        throw FetchDataException(
            'Error occured with status code : ${response.statusCode}',
            response.request!.url.toString());
      default:
    }
  }
}
