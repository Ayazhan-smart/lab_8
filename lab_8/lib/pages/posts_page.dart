import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
// ignore: unused_import
import '../models/post.dart';


class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc()..add(GetPostEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Posts")),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingPostState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FetchedPostsState) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            } else if (state is FailurePostsState) {
              return Center(child: Text("Ошибка при загрузке"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
