import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException? dioError) {
    switch (dioError?.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.connectionError:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError!.response!.statusCode!, dioError.response?.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = _handleError(
            dioError!.response!.statusCode!, dioError.response?.data);
        break;
    }
  }

  String? message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Session expired, please sign in again';
      case 422:
        return 'Unprocessable Entity';
      case 404:
        return 'Request not found';
      case 403:
        return 'Currently not available';
      case 405:
        return 'Method not allowed';
      case 406:
        return 'Not Acceptable client error';
      case 419:
        return 'Your exam is locked';
      case 500:
        return 'Internal server error';
      case 503:
        return 'Service Unavailable';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
