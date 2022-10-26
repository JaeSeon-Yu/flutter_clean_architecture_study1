import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test("stream 이 잘 작동해야 한다.", () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));

    await viewModel.fetch('iphone');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
      viewModel.state.photos,
      result,
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2295434,
    "pageURL":
        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type": "photo",
    "tags": "spring bird, bird, tit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g943a706bac39144d31cba94d26eed403a5623091bafc0964ff187ec026a0e0443ce1a61fab7dd752cce3dd17ff8bda97cda66b3b815843d0606c093a5c00b759_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gf17a840ba999cd360595cf49ccfb4c29b025200a82be8dc3cbf31117e88834c5c7aa6c071fa8759cbc6dd484e10f233cb0218f145e8b07420b08762dee15449e_1280.jpg",
    "imageWidth": 5363,
    "imageHeight": 3575,
    "imageSize": 2938651,
    "views": 552731,
    "downloads": 312422,
    "collections": 1986,
    "likes": 1934,
    "comments": 237,
    "user_id": 334088,
    "user": "JillWellington",
    "userImageURL":
        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gd746506cd0911085c1b160a68c4d1e802d3f676e84858f71abde135076810e677a92c12f95bd15eceb61586144bd9326163499cad802da0ad4c98ff6b5943f83_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g3614410bd40211985e36fe658badb7af633ace6191eaea812a2855bfd46a1aca8e91e4feb83916f13e6239b03542c77f03c9aed96b5777f52b8b9cb128163616_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 1002545,
    "downloads": 651740,
    "collections": 1365,
    "likes": 1502,
    "comments": 326,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  }
];
