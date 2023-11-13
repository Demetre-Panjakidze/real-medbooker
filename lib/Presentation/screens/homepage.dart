import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _firebase = FirebaseAuth.instance;

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage")),
      body: Column(
        children: [
          const Text("Homepage"),
          ElevatedButton(
            onPressed: () async {
              await Future.delayed(
                const Duration(
                  seconds: 2,
                ),
              );
              _firebase.signOut();
            },
            child: const Text("Log out"),
          ),
        ],
      ),
    );
  }
}
