import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';


class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  final baseUrl = 'https://pixabay.com/api/';
  final key = '30671614-e0e65aecb44d8138643a55e87';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    }
    catch(e) {
      return Result.error("error : $e");
    }
  }
}
