import 'package:flutter/material.dart';
import 'package:image_search/ui/data/api.dart';

class PhotoProvider extends InheritedWidget{
  final PixabayApi api;

  const PhotoProvider({Key? key, required this.api ,required Widget child}) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No Pixabay Api found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) => oldWidget.api != api;

}