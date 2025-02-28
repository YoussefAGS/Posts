import 'package:dio/dio.dart';


import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// String token1 ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNTE1MjExNy01ZDg1LTRmNmQtOGMzNy0zY2E0ZWIzMmVlYWYiLCJpYXQiOjE3MzM3NjEyMTgsImV4cCI6MTc2NTMxODgxOH0.Vk-R4CoFMhLvFBG-fXS6ukM4RU3TdvRd5gsxGXms3cc";
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  static Dio? dioWithToken;


  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    }
    else {
      return dio!;
    }
  }
  static Dio getDioWithToken() {
    Duration timeOut = const Duration(seconds: 30);

    if (dioWithToken == null) {
      dioWithToken = Dio();
      dioWithToken!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      dioWithToken?.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
      return dioWithToken!;
    }
    else {
      return dioWithToken!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      // 'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
      // 'Cookie': 'jwt=${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
      // 'Authorization': 'Bearer $token1',
      // 'Cookie': 'jwt=$token1',

    };
  }
  static void clearTokenFromHeader() {
    dio?.options.headers.remove('Authorization');
    dio?.options.headers.remove('Cookie');
  }
  static void clearDio() {
    dio = null;
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Cookie':'jwt=$token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

}
