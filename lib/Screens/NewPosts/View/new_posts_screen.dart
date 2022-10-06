import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_photos_api/Models/NewPosts/new_posts.dart';
import 'package:pagination_photos_api/Screens/NewPosts/Controller/new_posts_controller.dart';
import 'package:pagination_photos_api/Screens/NewPosts/Widgets/new_posts_item.dart';

class NewPostsScreen extends StatefulWidget {
  const NewPostsScreen({super.key});

  @override
  State<NewPostsScreen> createState() => _NewPostsScreenState();
}

class _NewPostsScreenState extends State<NewPostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => NewPostsController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<NewPostsController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Posts Screen'),
          centerTitle: true,
        ),
        body: PagedListView<int, NewPost>(
          pagingController: Get.find<NewPostsController>().pagingController,
          builderDelegate: PagedChildBuilderDelegate<NewPost>(
            itemBuilder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: NewPostItem(item.title, item.body),
              );
            },
          ),
        ));
  }
}
