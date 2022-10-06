import 'package:get/get.dart';
import 'package:pagination_photos_api/Screens/Home/View/home_screen.dart';
import 'package:pagination_photos_api/Screens/NewPosts/View/new_posts_screen.dart';
import 'package:pagination_photos_api/Screens/PhotosScreen/View/photos_screen.dart';
import 'package:pagination_photos_api/Screens/Posts/View/posts_screen.dart';

const String home = '/homeScreen';
const String photosScreen = '/photosScreen';
const String postsScreen = '/postsScreen';
const String newPostsScreen = '/newPostsScreen';

class Routes {
  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: photosScreen, page: () => const PhotosScreen()),
    GetPage(name: postsScreen, page: () => const PostsScreen()),
    GetPage(name: newPostsScreen, page: () => const NewPostsScreen()),
  ];
}
