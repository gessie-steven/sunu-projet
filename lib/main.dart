import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gessk_master_prg19_examen/screens/auth/login_screen.dart';
import 'package:gessk_master_prg19_examen/screens/auth/register_screen.dart';
import 'firebase_options.dart';  // Assure-toi que tu as généré ce fichier depuis Firebase Console
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RegisterScreen(),
    );
  }
}
