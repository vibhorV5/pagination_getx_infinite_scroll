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
        title: const Text('Pagination Screen'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isDataProcessing.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.lstTask.isNotEmpty) {
            return Column(
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Container(
                          height: 120,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text('Id :'),
                                  Text(controller.lstTask[index]['userId']
                                      .toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('UserId:'),
                                  Text(controller.lstTask[index]['id']
                                      .toString()),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    controller.lstTask[index]['title'],
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Data not found'),
            );
          }
        }
      }),
    );
  }
}
