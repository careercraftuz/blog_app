import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog_app/providers/post_provider.dart';
import 'package:blog_app/providers/user_provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  // controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // user provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // post provider
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
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
            const SizedBox(height: 10),
            // second password field
            TextField(
              controller: _password2Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            // alraedy have an account
            TextButton(
                child: const Text('Alreade have an account'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                }),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width * 0.1, 50),
                ),
              ),
              child: const Text('Sign Up'),
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
