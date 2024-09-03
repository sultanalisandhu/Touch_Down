import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'api_routes.dart';


class ClassApiServices {
  static final Dio _dio = Dio()..interceptors.add(_buildInterceptors());

  static InterceptorsWrapper _buildInterceptors() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.addAll(await _buildHeaders());
        return handler.next(options);
      },
      onResponse: (response, handler) {
        _logResponse(response);
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        _logError(e);
        if (e.response?.statusCode == 401) {
          await _handleAuthError(e, handler);
        } else if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          _notifyUser(
              "Request failed due to no internet. Please check your connection.");
          await Future.delayed(const Duration(seconds: 5));
          // Retry the request
          _retry(e, handler);
        } else {
          return handler.next(e);
        }
      },
    );
  }

  static Future<void> _retry(
      DioException e, ErrorInterceptorHandler handler, {int retryCount = 0}) async {
    if (retryCount >= 3) {
      handler.next(e); // Stop retrying after 3 attempts
      return;
    }
    try {
      final response = await _dio.fetch(e.requestOptions);
      handler.resolve(response);
    } catch (error) {
      if (error is DioException) {
        await Future.delayed(const Duration(seconds: 5)); // Wait before retrying
        _retry(error, handler, retryCount: retryCount + 1); // Increment retry count
      } else {
        handler.next(e); // Propagate if it's not a DioException
      }
    }
  }


  static Future<Response?> apiCall(
      String method,
      String endpoint, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        required RxBool isLoading,
      })

  async {
    final url = ApiRoutes.baseUrl + endpoint;
    isLoading.value = true;
    // Check if data is FormData or convert if necessary
    dynamic requestData = data;
    if (data is! FormData && containsFile(data)) {
      requestData = _convertToFormData(data);
    }
    try {
      _logApiCall(method, url, data);
      return await _dio.request(
        url,
        data: requestData,
        queryParameters: queryParameters,
        options: Options(method: method, headers: await _buildHeaders()),
        onSendProgress: (int sent, int total) {
          // double progress = sent / total;
          // debugPrint("Upload progress: $progress");
          // Optionally, update the UI or notify the user about the progress
        },
      );
    } on DioException catch (e) {
      return e.response;
    } finally {
      isLoading.value = false;
    }
  }

  static Future<Map<String, String>> _buildHeaders() async {
    final headers = {'Accept': 'application/json'};
    final bearerToken = LocalStorage.read(LocalStorage.bearerToken);
    if (bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    return headers;
  }

  static Future<void> _handleAuthError(DioException e, ErrorInterceptorHandler handler) async {
    await _refreshToken();
    final options = e.requestOptions;
    options.headers['Authorization'] = 'Bearer ${LocalStorage.read(LocalStorage.bearerToken)}';
    final response = await _dio.fetch(options);
    handler.resolve(response);
  }

  static Future<void> _refreshToken() async {
    // Implementation to refresh token
    Get.offAll(()=> LoginScreen());

  }

  // Utility to check if data contains a file (custom implementation needed)
  static bool containsFile(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data.values.any((value) => value is File);
    }
    return false;
  }

  // Convert data to FormData
  static FormData _convertToFormData(Map<String, dynamic> data) {
    FormData formData = FormData();
    data.forEach((key, value) {
      if (value is File) {
        formData.files.add(MapEntry(
          key,
          MultipartFile.fromFileSync(value.path, filename: value.path.split('/').last),
        ));
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });
    return formData;
  }

  static void _logApiCall(String method, String url, dynamic data) {
    debugPrint('API Call - Method: $method, URL: $url, Body: $data');
  }

  static void _logResponse(Response response) {
    debugPrint(
        'API Response - Status: ${response.statusCode}, Data: ${response.data}');
  }

  static void _logError(DioException e) {
    debugPrint(
        'API Error - Status: ${e.response?.statusCode}, Message: ${e.message}');
  }

  static void _notifyUser(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }
}