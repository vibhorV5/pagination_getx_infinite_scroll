import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_photos_api/Routes/routes.dart';
// import 'package:pagination_photos_api/Screens/NewPosts/Controller/new_posts_controller.dart';
// import 'package:pagination_photos_api/Screens/Pagination/Controller/pagination_controller.dart';
// import 'package:pagination_photos_api/Screens/PhotosScreen/Controller/photos_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Screen'),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(paginationScreen);
                      // photosController.getPhotos();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: const Text(
                        'Pagination Screen',
                      ),
                    )),
              ),

              // Center(
              //   child: TextButton(
              //       onPressed: () {
              //         Get.toNamed(newPostsScreen);
              //         // photosController.getPhotos();
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black87)),
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 50, vertical: 20),
              //         child: const Text(
              //           'New Posts Screen',
              //         ),
              //       )),
              // ),
              // Center(
              //   child: TextButton(
              //       onPressed: () {
              //         Get.toNamed(postsScreen);
              //         // photosController.getPhotos();
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black87)),
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 50, vertical: 20),
              //         child: const Text('Posts Screen'),
              //       )),
              // ),
              // Center(
              //   child: TextButton(
              //       onPressed: () {
              //         Get.toNamed(photosScreen);
              //         // photosController.getPhotos();
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black87)),
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 50, vertical: 20),
              //         child: const Text('Photos Screen'),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
