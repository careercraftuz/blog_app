import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _token;
  String? _userId;

  String? get token {
    return _token;
  }

  String? get userId {
    return _userId;
  }

  void login(String token, String userId) {
    _token = token;
    _userId = userId;

    notifyListeners();
  }

  void logout() {
    _token = null;
    _userId = null;

    notifyListeners();
  }
}
