import 'dart:developer';

import 'package:dio/dio.dart';

class CheckPhoneNumberExists {
  CheckPhoneNumberExists._();

  static Future<String> checkPhoneNumberExists(String phone, {String countryCode = '+91'}) async {
    const apiKey = 'VNY1owfpuaUUz62kQOKvDxWU20VUXiny';
    final url = 'http://apilayer.net/api/validate?$apiKey$countryCode$phone';

    final dio = Dio();
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = response.data;

        log(jsonResponse.toString());

        // Check if the number exists
        bool isPhoneValid = jsonResponse['success'];

        if (isPhoneValid) {
          return 'Phone number is valid';
        } else {
          return 'Phone number is invalid';
        }
      } else {
        return 'Failed to fetch phone number validation';
      }
    } catch (e) {
      return 'Error occurred: $e';
    }
  }

}