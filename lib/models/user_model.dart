class UserModel {
  String uid;
  String email;
  String role;
  String photoUrl;  // URL de la photo stockée (par exemple dans Supabase ou en local)

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.photoUrl,
  });

  // Méthode pour convertir un utilisateur à partir d'une Map (Firebase)
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      role: data['role'],
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  // Méthode pour convertir l'utilisateur en Map pour Firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'photoUrl': photoUrl,
    };
  }
}
