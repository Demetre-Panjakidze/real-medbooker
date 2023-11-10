import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medbooker/Presentation/screens/auth/auth.dart';
import 'package:medbooker/Presentation/screens/homepage.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
    return const MaterialApp(
      title: "Medbooker",
      home: AuthPage(),
    );
  }
}
