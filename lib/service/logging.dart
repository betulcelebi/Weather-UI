import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Logging extends Interceptor {
  Response? get response => null;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST  ${options.method} => ${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "RESPONSE  ${response.statusCode} => ${response.requestOptions.path}");
    switch (response.statusCode) {
      case 200:
        {
          Fluttertoast.showToast(
            msg: "The request succeed.",
            textColor: Colors.red
          );
        }
        break;
      case 404:
        {
          Fluttertoast.showToast(
              msg:
                  "The HTTP 404 Not Found response status code indicates that the server cannot find the requested resource.");
        }
        break;
      case 500:
        {
          Fluttertoast.showToast(
              msg:
                  "The server has encountered a situation it does not know how to handle.");
        }
        break;

      default:
        {}
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}
