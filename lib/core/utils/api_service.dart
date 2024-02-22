import 'package:dio/dio.dart';

class ApiService {
  late final Dio dio;

  ApiService(this.dio) {
    dio = Dio(BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1/',
      receiveDataWhenStatusError: true,
    ));
  }
  // static init() {
  //   dio = Dio(BaseOptions(
  //     baseUrl: 'https://www.googleapis.com/books/v1/',
  //     receiveDataWhenStatusError: true,
  //   ));
  // }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
