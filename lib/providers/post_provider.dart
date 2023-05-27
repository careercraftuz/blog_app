import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:blog_app/models/post_model.dart';

import 'constants.dart';

class PostProvider with ChangeNotifier {
  final List<PostModel> _posts = [];

  List<PostModel> get posts {
    return [..._posts];
  }

  // get post from request
  Future<void> getPosts() async {
    // TODO: get posts from request
    // create uri from url
    final uri = Uri.parse(getAllPostURL);

    // get response from request
    final response = await http.get(uri);

    // check if response is success
    if (response.statusCode == 200) {
      // get data from response
      final data = response.body;

      // json decode data
      final jsonData = jsonDecode(data);
      // get data from json data
      final posts = jsonData['data'];

      // loop data
      for (var post in posts) {
        // add post to list
        _posts.add(PostModel.fromJson(post));
      }

      // notify listeners
      notifyListeners();
    }
  }

  // get post by id
  PostModel? getPostById(int id) {
    // loop posts
    for (var post in _posts) {
      // check if post id is equal to id
      if (post.id == id) {
        // return post
        return post;
      }
    }

    // return null
    return null;
  }

  // create post
  Future<void> createPost(PostModel post) async {
    // TODO: create post from request
    // create uri from url
    final uri = Uri.parse(createPostUrl);

    // get response from request
    final response = await http.post(
      uri,
      body: {
        'title': post.title,
        'content': post.content,
        'author': post.author.toString(),
      },
    );

    // check if response is success
    if (response.statusCode == 200) {
      // get data from response
      final data = response.body;

      // json decode data
      final jsonData = jsonDecode(data);
      // get data from json data
      final post = jsonData['data'];

      // add post to list
      _posts.add(PostModel.fromJson(post));

      // notify listeners
      notifyListeners();
    }
  }

  // update post
  Future<void> updatePost(PostModel post) async {
    // TODO: update post from request
    // create uri from url
    final uri = Uri.parse(updatePostURL(post.id));

    // get response from request
    final response = await http.put(
      uri,
      body: {
        'title': post.title,
        'content': post.content,
        'author': post.author.toString(),
      },
    );

    // check if response is success
    if (response.statusCode == 200) {
      // get data from response
      final data = response.body;

      // json decode data
      final jsonData = jsonDecode(data);
      // get data from json data
      final post = jsonData['data'];

      // loop posts
      for (var i = 0; i < _posts.length; i++) {
        // check if post id is equal to id
        if (_posts[i].id == post['id']) {
          // update post
          _posts[i] = PostModel.fromJson(post);
        }
      }

      // notify listeners
      notifyListeners();
    }
  }

  // delete post
  Future<void> deletePost(int id) async {
    // TODO: delete post from request
    // create uri from url
    final uri = Uri.parse(deletePostURL(id));

    // get response from request
    final response = await http.delete(uri);

    // check if response is success
    if (response.statusCode == 200) {
      // loop posts
      for (var i = 0; i < _posts.length; i++) {
        // check if post id is equal to id
        if (_posts[i].id == id) {
          // remove post
          _posts.removeAt(i);
        }
      }

      // notify listeners
      notifyListeners();
    }
  }
}
