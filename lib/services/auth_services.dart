import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class AuthService {
  void signUp({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String email,
    required String type,
    required String password,
  }) async {
    try {
      User user = User(
          firstname: firstname,
          lastname: lastname,
          email: email,
          type: type,
          password: password);
      http.Response response = await http.post(
        Uri.parse(''),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 201) {
        print("success");
      }
    } catch (e) {
      print("échec");
    }
  }

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      http.Response res = await http.post(
        Uri.parse('/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {}
  }
}
