import 'dart:convert';
import 'package:image_search/data/photo_api_repository.dart';

import '../../model/photo.dart';
import 'package:http/http.dart' as http;


class PixabayApi implements PhotoApiRepository{
  final baseUrl = 'https://pixabay.com/api/';
  final key = '30671614-e0e65aecb44d8138643a55e87';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {

    client ??= http.Client();

    final response = await client.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}