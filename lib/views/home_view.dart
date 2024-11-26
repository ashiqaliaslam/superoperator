import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/procedure_categories.dart';
import '../src/app_state.dart';
import 'profile_view.dart';
import 'sign_in_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String route = 'home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedure Types'),
        actions: [
          Consumer<ApplicationState>(
            builder: (context, appState, child) {
              return IconButton(
                icon: const Icon(Icons.person_3),
                onPressed: () {
                  !appState.loggedIn
                      ? Navigator.pushNamed(context, SignInView.route)
                      : Navigator.pushNamed(context, ProfileView.route);
                },
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: procedureCategories.length,
        itemBuilder: (context, index) {
          final item = procedureCategories[index];
          return Card(
            elevation: 8,
            color: Colors.lightBlueAccent,
            child: InkWell(
              onTap: () {
                // TODO: onTap Procedure Type
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  footer: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Icon(Icons.image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
