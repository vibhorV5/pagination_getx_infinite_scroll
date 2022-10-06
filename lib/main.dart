import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_photos_api/Routes/routes.dart';
import 'package:pagination_photos_api/Screens/Home/View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      title: 'Pagination with Photos/Posts Api',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}
