import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_photos_api/Screens/Pagination/Controller/pagination_controller.dart';

class PaginationScreen extends GetView<PaginationController> {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PaginationController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Screen'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isDataProcessing.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.lstTask.length > 0) {
            return Container(
              child: Column(
                children: [
                  // Expanded(child: Text(controller.lstTask[0].toString())),
                  Expanded(
                    child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.lstTask.length,
                        itemBuilder: (context, index) {
                          {
                            if (index == controller.lstTask.length - 1 &&
                                controller.isMoreDataAvailable.value == true) {
                              return Container(
                                  margin:
                                      EdgeInsets.only(left: 175, right: 175),
                                  child: const CircularProgressIndicator());
                            }
                            return Container(
                                height: 120,
                                color: Colors.orangeAccent.withOpacity(0.4),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Id :'),
                                        Text(controller.lstTask[index]['userId']
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('UserId:'),
                                        Text(controller.lstTask[index]['id']
                                            .toString()),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: Container(
                                        width: 200,
                                        child: Text(
                                          controller.lstTask[index]['title'],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ));
                          }
                        }),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Data not found'),
            );
          }
        }
      }),
    );
  }
}
