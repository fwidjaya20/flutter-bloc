import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:bloc_test/bloc/post/bloc.dart';
import 'package:bloc_test/model/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({
    @required this.httpClient
  });

  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts(0, 20);

          yield PostLoaded(
            posts: posts,
            hasReachedMax: false
          );
        }

        if (currentState is PostLoaded) {
          final posts = await _fetchPosts((currentState as PostLoaded).posts.length, 20);
          yield posts.isEmpty
              ? (currentState as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
                posts: (currentState as PostLoaded).posts + posts,
                hasReachedMax: false
              );
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  _hasReachedMax(PostState state) {
    return state is PostLoaded && state.hasReachedMax;
  }

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final String endpoint = 'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';

    final response = await httpClient.get(endpoint);

    if (200 != response.statusCode) {
      throw Exception('Error while fetching posts');
    }

    final data = json.decode(response.body) as List;

    return data.map((rawPost) {
      return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body']
      );
    }).toList();
  }
}