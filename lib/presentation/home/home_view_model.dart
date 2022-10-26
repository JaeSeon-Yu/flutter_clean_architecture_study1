import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_state.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

import '../../data/data_source/result.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        log('message : $message');
        _eventController.add(HomeUiEvent.showSnackbar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners(); // 옵저버들에게 알림
  }
}
