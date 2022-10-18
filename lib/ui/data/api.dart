import 'dart:convert';
import '../../model/photo.dart';
import 'package:http/http.dart' as http;


class PixabayApi{
  final baseUrl = 'https://pixabay.com/api/';
  final key = '30671614-e0e65aecb44d8138643a55e87';
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
