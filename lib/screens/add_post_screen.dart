import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';

class AddPostPage extends StatelessWidget {
  AddPostPage({Key? key}) : super(key: key);

  // text editing controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  static const routeName = '/add_post';

  @override
  Widget build(BuildContext context) {
    // post provider
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Post'),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Content',
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print('pressed');
                    print(_titleController.text);
                    postProvider.createPost(_titleController.text, _contentController.text);
                    print('second');
                    Navigator.pushReplacementNamed(context, '/home');
                    print('end');
                  },
                  child: const Text('Add Post'),
                ),
              ],
            ),
          ),
        ));
  }
}
