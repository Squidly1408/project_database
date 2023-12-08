import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project_database/screens/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:project_database/screens/splash.dart';
import 'auth/login.dart';
import 'firebase_options.dart';
import 'models/user.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project: Database',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Splash();
          }
          if (snapshot.hasData) {
            return const Home();
          }
          return const Login();
        },
      ),
    );
  }
}
