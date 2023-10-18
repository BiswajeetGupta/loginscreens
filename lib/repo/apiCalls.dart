// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class Apicalls {
  final String baseUrl = "https://tukki.cssrender.com/api/v1/";

  Future<void> apihitforSignUp(
    String firstName,
    String email,
    String country,
    String password,
  ) async {
    final Map<String, dynamic> data = {
      'first_name': firstName,
      'phone_country': country,
      'password': password,
      'last_name': email,
      'birthdate': "2023-08-16"
    };

    print(data);

    final Uri url = Uri.parse('$baseUrl/userRegister');

    try {
      final response = await http.post(url, body: jsonEncode(data));

      if (response.statusCode == 200) {
        print('API Response: ${response.body}');
       
      } else {
        print('Request failed with status: ${response.statusCode}');
         
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> apihitforLogIn(String phone, String password, country) async {
    final Map<String, dynamic> data = {
      'phone': phone,
      'password': password,
      'phone_country': country,
    };
    print(data);
    final Uri url = Uri.parse('$baseUrl/userLogin');
    try {
      final response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        print('API Response: ${response.body}');
       
      } else {
        print('Request failed with status: ${response.statusCode}');
        
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
