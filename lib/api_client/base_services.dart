 import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'as getx ;
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/utils/local_storage.dart';

 class BaseServices extends getx.GetxService  {
   final Dio _dio = Dio(BaseOptions(baseUrl: ApiRoutes.baseUrl, headers: {
       'Accept': 'application/json',
       'Authorization': 'Bearer ${LocalStorage.instance.bearerToken}',
     },
   ));

   Future<dynamic> apiCall(String method, String endpoint, {dynamic data}) async {
     try {
       debugPrint('API Call: $method ${ApiRoutes.baseUrl + endpoint} \nHeaders: ${_dio.options.headers} \nBody: $data');
       String completeUrl = ApiRoutes.baseUrl + endpoint;
        Response response ;

       switch (method.toUpperCase()) {
         case 'GET':
           response = await _dio.get(completeUrl);
           break;
         case 'POST':
           response = await _dio.post(completeUrl, data: data);
           break;
         case 'PUT':
           response = await _dio.put(completeUrl, data: data);
           break;
         case 'DELETE':
           response = await _dio.delete(completeUrl);
           break;
         default:
           throw Exception('Unsupported HTTP method: $method');
       }

       debugPrint('API Response: ${response.data}');
       return response.data;
     } catch (e) {
       // Handle error
       debugPrint('Error occurred during API call: $e');
       return null;
     }
   }


 }
