import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiService');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout with ApiService');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive Timeout with ApiService');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with ApiService');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            exception.response!.statusCode!, exception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiService was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later');
    } else if (statusCode >= 500) {
      return ServerFailure('There is a problem with server, Please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error, Please try later');
    }
  }
}

// class CacheFailure extends Failure {}

// class NetworkFailure extends Failure {}
