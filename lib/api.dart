import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const url = "http://10.0.2.2:8080";

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['lastname'],
      email: json['email'],
    );
  }
}

/////////////////////API
class Api {
  static const String baseURL = 'http://10.0.2.2:8080';

  static Future<bool> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/client/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      final cookie = response.headers['set-cookie'];
      prefs.setString('session_cookie', cookie!);

      ///
      return true;
    } else {
      return false;
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString('session_cookie');
    await http.post(
      Uri.parse('$baseURL/client/logout'),
      headers: <String, String>{
        'Cookie': cookie!,
      },
    );
    prefs.remove('session_cookie');
  }

  static Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString('session_cookie');
    final response = await http.post(
      Uri.parse('$baseURL/client/account'),
      headers: <String, String>{
        'Cookie': cookie!,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'type': 'individual',
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
