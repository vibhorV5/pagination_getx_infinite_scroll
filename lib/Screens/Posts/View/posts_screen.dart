import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_photos_api/Models/Posts/posts.dart';
import 'package:pagination_photos_api/Screens/Posts/Widgets/post_item.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  PostsScreenState createState() => PostsScreenState();
}

class PostsScreenState extends State<PostsScreen> {
  final _numberOfPostsPerRequest = 10;

  final PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    // try {
    //   final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
    //   final isLastPage = newItems.length < _pageSize;
    //   if (isLastPage) {
    //     _pagingController.appendLastPage(newItems);
    //   } else {
    //     final nextPageKey = pageKey + newItems.length;
    //     _pagingController.appendPage(newItems, nextPageKey);
    //   }
    // } catch (error) {
    //   _pagingController.error = error;
    // }
    try {
      final response = await get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts?_page=$pageKey&_limit=$_numberOfPostsPerRequest"));
      List responseList = json.decode(response.body);
      List<Post> postList = responseList
          .map((data) => Post(data['title'], data['body']))
          .toList();
      final isLastPage = postList.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      debugPrint("error --> $e");
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Screen"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedListView<int, Post>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Post>(
            itemBuilder: (context, item, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: PostItem(item.title, item.body),
            ),
          ),
        ),
      ),
    );
  }
}
