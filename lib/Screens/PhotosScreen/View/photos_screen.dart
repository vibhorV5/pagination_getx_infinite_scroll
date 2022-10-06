import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_photos_api/Models/Photos/photos.dart';
import 'package:pagination_photos_api/Screens/PhotosScreen/Controller/photos_controller.dart';
import 'package:pagination_photos_api/Screens/PhotosScreen/Widgets/photo_item.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => PhotosController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<PhotosController>();
    // Get.find<PhotosScreen>().photosList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photos Screen'),
          centerTitle: true,
        ),
        body: PagedListView<int, Photos>(
          pagingController: Get.find<PhotosController>().pagingController,
          builderDelegate: PagedChildBuilderDelegate<Photos>(
            itemBuilder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: PhotoItem(item.title, item.url),
              );
            },
          ),
        ));
  }
}
