import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:inmobosco/models/inmuebles.dart';

const _postLimit = 20;


@singleton
class InmuebleRepository {

  final httpClient = http.Client();

  Future<List<InmuebleResponse>> fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return List<InmuebleResponse>.from(
        //list.map((p) => Post.fromJson(p))
        body.map((p) => InmuebleResponse.fromJson(p))
      );
      
    }
    throw Exception('error fetching posts');
  }



}