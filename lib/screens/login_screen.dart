import 'package:blog_app/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog_app/providers/user_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  // controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // post provider
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            // don't have an account
            TextButton(
                child: const Text('Don\'t have an account'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                }),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width * 0.1, 50),
                ),
              ),
              child: const Text('Login'),
              onPressed: () {
                userProvider.login(
                  _usernameController.text,
                  _passwordController.text,
                );
                postProvider.getPosts();
                Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ),
      )),
    );
  }
}
