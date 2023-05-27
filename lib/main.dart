import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/post_provider.dart';
import 'providers/user_provider.dart';

import 'screens/post_screen/subdir/add_post_screen.dart';
import 'screens/post_screen/post_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => PostProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/': (context) => LoginPage(),
        '/home': (context) => const Postpage(),
        '/add_post': (context) => AddPostPage(),
      },
    );
  }
}
