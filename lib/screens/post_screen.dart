import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog_app/providers/post_provider.dart';
import 'package:blog_app/providers/user_provider.dart';

class Postpage extends StatelessWidget {
  const Postpage({super.key});

  @override
  Widget build(BuildContext context) {
    // post provider
    final postProvider = Provider.of<PostProvider>(context);
    // user provider
    final userProvider = Provider.of<UserProvider>(context);
    print(postProvider.posts);
    if (userProvider.token == '') {
      Navigator.pushReplacementNamed(context, '/');
    }
    return userProvider.token != null
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              actions: [
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(context, '/add_post');
                    }),
                IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      userProvider.logout();
                      Navigator.pushReplacementNamed(context, '/');
                    }),
              ],
            ),
            body: Center(
              child: ListView.builder(
                itemCount: postProvider.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(postProvider.posts[index].title),
                    subtitle: Text(postProvider.posts[index].content),
                  );
                },
              ),
            ))
        : const Center(child: CircularProgressIndicator());
  }
}
