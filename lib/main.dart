import 'package:ekart/firebase_options.dart';
import 'package:ekart/model/Api.dart';
import 'package:ekart/model/provider.dart';
import 'package:ekart/utils/customcolors.dart';
import 'package:ekart/view/Home.dart';
import 'package:ekart/view/products.dart';
import 'package:ekart/view/profile.dart';

import 'package:ekart/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiConnection()),
        ChangeNotifierProvider(create: (_) => Savelogin()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColour),
          useMaterial3: true,
        ),
        home: splash(),
//       routes: {
//  '/home': (context) => Home(),
//  '/cart': (context) => Products(),
// //  '/settings': (context) => SettingsPage(),
//  '/profile': (context) => Profile(),
// },

      )
    );
  }
}
