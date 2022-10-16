import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:sara_flutter/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                    clientId:
                        '1095585625883-dmp6pelvi64mg3opog9comu2hj5kpjh8.apps.googleusercontent.com'),
              ],
              subtitleBuilder: (context, action) {
                return Text(action == AuthAction.signIn
                    ? "Welcome - Sign In"
                    : "Welcome - Sign Up");
              },
              footerBuilder: (context, action) {
                return const Text(
                  'By signing in, you agree to our terms and conditions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                );
              },
            );
          }
          return const HomeScreen();
        });
  }
}
