// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:flutter/material.dart';
// import 'package:superoperator/home.dart';

// import 'views/sign_in_view.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const SignInView();
//         }
//         return const HomeScreen();
//       },
//     );
//   }
// }
