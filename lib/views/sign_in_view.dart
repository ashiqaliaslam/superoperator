import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
  });

  static String route = 'sign_in';

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction(
          (context, state) {
            final user = switch (state) {
              SignedIn state => state.user,
              UserCreated state => state.credential.user,
              _ => null
            };
            if (user == null) {
              return;
            }
            if (state is UserCreated) {
              user.updateDisplayName(user.email!.split('@')[0]);
            }
            if (!user.emailVerified) {
              user.sendEmailVerification();
              const snackBar = SnackBar(
                  content: Text(
                      'Please check your email to verify your email address'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            Navigator.pushNamed(context, HomeView.route);
          },
        )
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },

      providers: [
        EmailAuthProvider(),
      ],

      ///

      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/images/fpcl_logo.png'),
          ),
        );
      },
      // subtitleBuilder: (context, action) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 8.0),
      //     child: action == AuthAction.signIn
      //         ? const Text('Welcome to FlutterFire, Please sign in!')
      //         : const Text('Welcome to FlutterFire, please sign up!'),
      //   );
      // },
      // footerBuilder: (context, action) {
      //   return const Padding(
      //     padding: EdgeInsets.only(top: 16.0),
      //     child: Text(
      //       'By signing in, you agree to our terms and conditions',
      //       style: TextStyle(
      //         color: Colors.grey,
      //       ),
      //     ),
      //   );
      // },
      // sideBuilder: (context, constraints) {
      //   return Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: AspectRatio(
      //       aspectRatio: 1,
      //       child: Image.asset('assets/images/flutterfire_300x.png'),
      //     ),
      //   );
      // },
    );
  }
}
