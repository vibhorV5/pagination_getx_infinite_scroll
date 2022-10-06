import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_photos_api/Models/NewPosts/new_posts.dart';
import 'package:http/http.dart' as http;

class NewPostsController extends GetxController {
  // final _numberOfPostsPerRequest = 10;
  RxInt numberOfPostsPerRequest = 10.obs;
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

  final PagingController<int, NewPost> pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await http.get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts?_page=$pageKey&_limit=$numberOfPostsPerRequest"));
      List responseList = json.decode(response.body);
      List<NewPost> postList = responseList
          .map((data) => NewPost(data['title'], data['body']))
          .toList();

      final isLastPage = postList.length < numberOfPostsPerRequest.value;
      if (isLastPage) {
        pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      debugPrint("error --> $e");
      pagingController.error = e;
    }
  }
}
