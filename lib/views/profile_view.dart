import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/app_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static String route = 'profile_view';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, child) => ProfileScreen(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        key: ValueKey(appState.emailVerified),
        providers: const [],
        actions: [
          SignedOutAction(
            (context) {
              // Navigator.pushNamed(context, HomeView.route);
              Navigator.of(context).pop();
            },
          ),
        ],
        children: [
          Visibility(
            visible: !appState.emailVerified,
            child: OutlinedButton(
              onPressed: () {
                appState.refreshLoggedInUser();
              },
              child: const Text('Recheck Verification State'),
            ),
          ),
        ],
      ),
    );
  }
}
