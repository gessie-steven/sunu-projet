import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  AuthService _authService = AuthService();
  UserModel? _user;

  UserModel? get user => _user;

  // Inscription
  Future<bool> register(String email, String password) async {
    final newUser = await _authService.register(email, password);
    if (newUser != null) {
      _user = newUser;
      notifyListeners();
      return true;
    }
    return false;
  }

  // Connexion
  Future<bool> login(String email, String password) async {
    final loggedInUser = await _authService.login(email, password);
    if (loggedInUser != null) {
      _user = loggedInUser;
      notifyListeners();
      return true;
    }
    return false;
  }

  // Déconnexion
  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  // Vérifier si un utilisateur est connecté
  bool get isAuthenticated => _user != null;
}
