import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_photos_api/Models/Photos/photos.dart';

class PhotosController extends GetxController {
  // final _numberOfPostsPerRequest = 10;
  RxInt numberOfPhotosPerRequest = 10.obs;
  RxInt firstPageKey = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  final PagingController<int, Photos> pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await http.get(Uri.parse(
          "https://jsonplaceholder.typicode.com/photos?_page=$pageKey&_limit=$numberOfPhotosPerRequest"));
      List responseList = json.decode(response.body);
      List<Photos> photosList = responseList
          .map((data) => Photos(
                data['title'],
                data['url'],
              ))
          .toList();

      final isLastPage = photosList.length < numberOfPhotosPerRequest.value;
      if (isLastPage) {
        pagingController.appendLastPage(photosList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(photosList, nextPageKey);
      }
    } catch (e) {
      debugPrint("error --> $e");
      pagingController.error = e;
    }
  }
}
