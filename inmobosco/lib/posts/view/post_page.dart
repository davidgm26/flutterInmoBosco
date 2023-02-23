import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmobosco/posts/bloc/post_bloc.dart';
import 'package:inmobosco/posts/view/views.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => PostBloc()..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}