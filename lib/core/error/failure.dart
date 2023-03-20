import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});
  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
  factory ServerFailure.fromDioException(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return const ServerFailure(
          message: 'Connection Timeout',
        );
      case DioErrorType.sendTimeout:
        return const ServerFailure(
          message: 'Send Timeout',
        );
      case DioErrorType.receiveTimeout:
        return const ServerFailure(
          message: 'Receive Timeout',
        );
      case DioErrorType.response:
        return ServerFailure.fromResponse(dioError.response!);
      case DioErrorType.cancel:
        return const ServerFailure(
          message: 'Request Cancelled',
        );
      case DioErrorType.other:
        if (dioError.message.contains('SocketException') ||
            dioError.message.contains('HttpException')) {
          return const ServerFailure(
            message: 'No Internet Connection',
          );
        }
        return const ServerFailure(
          message: 'Unexpected Error',
        );
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ServerFailure(
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    } else if (response.statusCode == 404) {
      return const ServerFailure(message: 'Not Found');
    } else if (response.statusCode == 500 ||
        response.statusCode == 502 ||
        response.statusCode == 503 ||
        response.statusCode == 504) {
      return const ServerFailure(message: 'Internal Server Error');
    } else {
      return const ServerFailure(message: 'Unexpected Error');
    }
  }
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
}
