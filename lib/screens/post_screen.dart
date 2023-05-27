import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog_app/providers/post_provider.dart';
import 'package:blog_app/providers/user_provider.dart';

class Postpage extends StatelessWidget {
  const Postpage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    // post provider
    final postProvider = Provider.of<PostProvider>(context);
    // user provider
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: userProvider.token != null
            ? Center(
                child: postProvider.posts.isEmpty
                    ? ListView.builder(itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(postProvider.posts[index].title),
                          subtitle: Text(postProvider.posts[index].content),
                        );
                      })
                    : const CircularProgressIndicator(),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
