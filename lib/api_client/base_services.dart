import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/utils/local_storage.dart';

class BaseServices {
  final Dio _dio;

  BaseServices()
      : _dio = Dio(
    BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
    ),
  );

   Future<Response?> apiCall(String method, String endpoint, {dynamic data,}) async {
    final headers = await _buildHeaders();
    final url = ApiRoutes.baseUrl + endpoint + (method.toUpperCase() == 'GET' ? _buildQueryString(data) : '');

    try {
      debugPrint('''
╔═══════════════════════════════════════════════════╗
║                   API Call Details                ║
╟───────────────────────────────────────────────────╢
║ URL: $url
║ Method: $method
║ Headers: $headers
║ Body: $data
╚═══════════════════════════════════════════════════╝
''');

      final response = await _dio.request(
        url,
        data: method.toUpperCase() == 'GET' ? null : data,
        queryParameters: method.toUpperCase() == 'GET' ? data : null,
        options: Options(method: method, headers: headers),
      );

      return response;
    } on DioException catch (e) {
      debugPrint('''
╔═══════════════════════════════════════════════════╗
║                   API Call Error                  ║
╟───────────────────────────────────────────────────╢
║ URL: $url
║ Error: ${e.message}
║ Response: ${e.response?.data ?? 'No Response Data'}
╚═══════════════════════════════════════════════════╝
''');
      return e.response;
    } catch (e) {
      debugPrint('''
╔═══════════════════════════════════════════════════╗
║                Unexpected Error                   ║
╟───────────────────────────────────────────────────╢
║ URL: $url
║ Error: $e
╚═══════════════════════════════════════════════════╝
''');
      return null;
    }
  }

  Future<Map<String, String>> _buildHeaders() async {
    final headers = {'Accept': 'application/json'};
    final bearerToken = LocalStorage.instance.bearerToken;

    if (bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    return headers;
  }

  String _buildQueryString(Map<String, dynamic>? params) {
    if (params == null || params.isEmpty) return '';

    final queryString = StringBuffer('?');
    params.forEach((key, value) {
      queryString.write('$key=$value&');
    });

    return queryString.toString().substring(0, queryString.length - 1); // Remove trailing '&'
  }
}
