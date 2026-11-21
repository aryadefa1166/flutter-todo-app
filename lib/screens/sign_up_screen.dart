import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_notifier.dart';
import '../utils/snackbar_helper.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenWidth * 0.05),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: screenWidth * 0.05),
            ElevatedButton(
                onPressed: authNotifier.isLoading ? null : () async {
                  bool success = await authNotifier.signUp(
                    emailController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Navigator.pop(context);
                    SnackBarHelper.show(context, 'Berhasil Sign Up! Silakan Login', isError: false);
                  } else {
                    SnackBarHelper.show(context, 'Gagal Sign Up');
                  }
                },
                child: authNotifier.isLoading
                    ? CircularProgressIndicator()
                    : Text('Register')
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Sudah punya akun? Sign In'),
            )
          ],
        ),
      ),
    );
  }
}
