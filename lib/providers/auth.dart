import 'package:flutter/material.dart';
import 'package:footzone/constants/enums.dart';

class AuthState extends ChangeNotifier {
  UserState _state = UserState.guest;
  get getState {
    return _state;
  }

  void logIn(UserState st) {
    _state = st;
    notifyListeners();
  }

  void logOut() {
    _state = UserState.guest;
    notifyListeners();
  }
}
