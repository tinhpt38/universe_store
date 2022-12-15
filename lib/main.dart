import 'package:flutter/material.dart';
import 'package:universe_store/app/modules/counter/couterPage.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  // runApp(const MyApp());
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Universe Store',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const SignInPage(),
//     );
//   }
// }

