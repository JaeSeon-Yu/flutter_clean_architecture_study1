import 'package:image_search/domain/repository/photo_api_repository.dart';
import '../data_source/pixabay_api.dart';
import '../../domain/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApiRepositoryImpl implements PhotoApiRepository{
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}