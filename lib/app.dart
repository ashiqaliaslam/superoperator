import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superoperator/views/test_view.dart';

import 'views/home_view.dart';
import 'views/procedure_detail_view.dart';
import 'views/procedure_list_view.dart';
import 'views/profile_view.dart';
import 'views/sign_in_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Meetup',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      // initialRoute: TestView.route,
      initialRoute: HomeView.route,

      routes: {
        TestView.route: (context) => const TestView(),
        HomeView.route: (context) => const HomeView(),
        SignInView.route: (context) => const SignInView(),
        ProfileView.route: (context) => const ProfileView(),
        ProcedureListView.route: (context) => const ProcedureListView(),
        ProcedureDetailsView.route: (context) => ProcedureDetailsView(),
      },
    );
  }
}
