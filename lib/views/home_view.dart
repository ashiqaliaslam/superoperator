import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/procedure_categories.dart';
import '../src/app_state.dart';
import 'profile_view.dart';
import 'sign_in_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String route = 'home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;

    Future<void> getMessages() async {
      final messages = await _firestore.collection('procedure').get();
      log(messages.toString());
      for (var message in messages.docs) {
        log(message.data().toString());
      }
    }

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
      // body: StreamBuilder<QuerySnapshot>(
      //     stream:
      //         FirebaseFire store.instance.collection('procedure').snapshots(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         return Center(child: Text('Error'));
      //       }
      //       if (snapshot.connectionState == ConnectionState.waiting)
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       return ListView.builder(
      //         itemCount: snapshot.data?.docs.length,
      //         shrinkWrap: true,
      //         itemBuilder: (context, i) {
      //           final item = snapshot.data!.docs[i]; // grid i
      //           return Card(
      //             elevation: 8,
      //             color: Colors.lightBlueAccent,
      //             child: InkWell(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: GridTile(
      //                   footer: Text(
      //                     item['name'],
      //                     style: const TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   child: const Icon(Icons.image),
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }),
    );
  }
}

// List<String> procedureCategories = [
//   'Changeover Procedures',
//   'Emergency Handling Procedures',
//   'Miscellaneous Procedures',
//   'HSE Procedures',
//   'Startup Procedures',
// ];

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 2,
//           mainAxisSpacing: 2,
//         ),
//         itemCount: procedureCategories.length,
//         itemBuilder: (context, index) {
//           final item = procedureCategories[index];
//           return Card(
//             elevation: 8,
//             color: Colors.lightBlueAccent,
//             child: GridTile(
//               footer: Text(item),
//               child: const Icon(Icons.image),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:superoperator/models/procedure.dart';

// class User {
//   final String username;
//   final String email;

//   User({
//     required this.username,
//     required this.email,
//   });

//   static User fromJson(json) => User(
//         username: json['username'],
//         email: json['email'],
//       );
// }

// class UsersApi {
//   static Future<List<User>> getUsersLocally(BuildContext context) async {
//     final assetBundle = DefaultAssetBundle.of(context);
//     log(assetBundle.toString());
//     final data = await assetBundle.loadString('assets/users.json');
//     log(data);
//     final body = json.decode(data);
//     log(body);

//     return body.map<User>(User.fromJson).toList();
//     // return body;
//   }
// }

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   static String route = 'procedures';

//   Widget buildUsers(List<User> users) => ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final user = users[index];

//           return ListTile(
//             title: Text(user.email),
//           );
//         },
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BFP Changeover'),
//       ),
//       body: Column(
//         children: [
//           // Text(loadJsonData().toString()),
//           FutureBuilder<List<User>>(
//             future: UsersApi.getUsersLocally(context),
//             builder: (context, snapshot) {
//               final users = snapshot.data;

//               switch (snapshot.connectionState) {
//                 case ConnectionState.waiting:
//                   return const Center(child: CircularProgressIndicator());
//                 default:
//                   if (snapshot.hasError) {
//                     return const Center(child: Text('Some error occured!'));
//                   } else {
//                     return buildUsers(users!);
//                   }
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
