import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:superoperator/home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              // GoogleProvider(
              //   clientId: '925969828172-ec1hn9hdff0gn3pb9ja2chr0gtvqf1qt',
              //   // '925969828172-ec1hn9hdff0gn3pb9ja2chr0gtvqf1qt.apps.googleusercontent.com',
              //   // 'AIzaSyBG4JgKcHP4TVlB5w_tIgeDGTzNkM7sCBQ',
              // )
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/flutterfire_300x.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to FlutterFire, Please sign in!')
                    : const Text('Welcome to FlutterFire, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'By signing in, you agree to our terms and conditions',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            },
            sideBuilder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/flutterfire_300x.png'),
                ),
              );
            },
          );
        }
        return const HomeScreen();
      },
    );
  }
}
