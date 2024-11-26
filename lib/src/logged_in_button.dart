import 'package:flutter/material.dart';

import '../views/profile_view.dart';
import '../views/sign_in_view.dart';

class LoggedInButton extends StatelessWidget {
  const LoggedInButton({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            !loggedIn
                ? Navigator.pushNamed(context, SignInView.route)
                : signOut();
          },
          child: !loggedIn ? const Text('Create') : const Text('Logout'),
        ),
        Visibility(
          visible: loggedIn,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileView.route);
            },
            icon: const Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
