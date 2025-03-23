import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Inscription d'un utilisateur avec email et mot de passe
  Future<UserModel?> register(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: user.email!,
          role: 'membre',  // Tu peux gérer les rôles ici
          photoUrl: '',    // Assure-toi d'ajouter une gestion de photo
        );
      }
      return null;
    } catch (e) {
      print('Erreur d\'inscription : $e');
      return null;
    }
  }

  // Connexion d'un utilisateur avec email et mot de passe
  Future<UserModel?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: user.email!,
          role: 'membre',  // Gestion des rôles
          photoUrl: '',    // Photo URL
        );
      }
      return null;
    } catch (e) {
      print('Erreur de connexion : $e');
      return null;
    }
  }

  // Déconnexion de l'utilisateur
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Récupérer l'utilisateur courant
  UserModel? getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      return UserModel(
        uid: user.uid,
        email: user.email!,
        role: 'membre',  // Gestion des rôles
        photoUrl: '',    // Photo URL
      );
    }
    return null;
  }
}
