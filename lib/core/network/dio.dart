// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class DioHelper {
  Dio dio;
  DioHelper({
    required this.dio,
  });

  Future<Response<dynamic>?> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      onReceiveProgress: onReceiveProgress,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response<dynamic>?> postData({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    return await dio.post(
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      url,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<dynamic> deleteData(
      {String? url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    return await dio.delete(
      url!,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  Future<dynamic> patchData({
    String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    return await dio.patch(
      data: data,
      url!,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }
}
