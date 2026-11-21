import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth/auth_services.dart';

class AuthNotifier with ChangeNotifier {
  final AuthServices _authServices = AuthServices();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //Notifier untuk Sign Up
  Future<bool> signUp(String email, String password) async {
    _setLoading(true);
    try {
      User? user = await _authServices.signUp(email, password);
      return user != null;
    } finally {
      _setLoading(false);
    }
  }

  //Notifier untuk Sign In
  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    try {
      User? user = await _authServices.signIn(email, password);
      return user != null;
    } finally {
      _setLoading(false);
    }
  }

  //Notifier untuk Sign Out
  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _authServices.signOut();
    } finally {
      _setLoading(false);
    }
  }
}
