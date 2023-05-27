import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './constants.dart';

class UserProvider with ChangeNotifier {
  String? _token;
  String? _userId;

  String? get token {
    return _token;
  }

  String? get userId {
    return _userId;
  }

  // login user by requesting token from server
  Future<void> login(String username, String password) async {
    // TODO: login user by requesting token from server
    // create uri from url
    final uri = Uri.parse(loginUserURL);
    print(password);
    print(username);
    // get response from request
    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ));

    print(response.body);

    // check if response is success
    if (response.statusCode == 200) {
      // get data from response
      final data = response.body;

      // json decode data
      final jsonData = jsonDecode(data);

      // get data from json data
      final token = jsonData['token'];
      final userId = jsonData['id'];

      // set token and userId
      _token = token;
      _userId = userId;

      // notify listeners
      notifyListeners();
    }
  }

  // signup user by requesting token from server
  Future<void> signup(String username, String password) async {
    // TODO: signup user by requesting token from server
    // create uri from url
    final uri = Uri.parse(createUserURL);

    // get response from request
    final response = await http.post(
      uri,
      body: {
        'username': username,
        'password': password,
      },
    );

    // check if response is success
    if (response.statusCode == 200) {
      // get data from response
      final data = response.body;

      // json decode data
      final jsonData = jsonDecode(data);

      // get data from json data
      final token = jsonData['token'];
      final userId = jsonData['userId'];

      // set token and userId
      _token = token;
      _userId = userId;

      // notify listeners
      notifyListeners();
    }
  }

  // logout user by removing token and userId
  Future<void> logout() async {
    // TODO: logout user by removing token and userId
    // set token and userId to null
    _token = null;
    _userId = null;

    // notify listeners
    notifyListeners();
  }
}
