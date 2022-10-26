import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

import '../model/photo.dart';

class GetPhotosUseCase{
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> call(String query) async {
    final result = await repository.fetch(query);

    return result.when(
      success: (photos){
        if(photos.length>3) {
          return Result.success(photos.sublist(0,3));
        }
        return Result.success(photos);
      },
      error: (message) {
        return Result.error(message);
      }
    );
  }

}