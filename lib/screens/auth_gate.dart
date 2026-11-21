import 'package:flutter/material.dart';
import 'package:pertemuan_5/screens/todo_screen.dart';
import '../services/auth/auth_service.dart';
import 'todo_screen.dart';
import 'profile_screen.dart';
import 'sign_in_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return StreamBuilder(
        stream: auth.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TodoScreen();
          } else {
            return SignInScreen();
          }
        }
    );
  }
}
