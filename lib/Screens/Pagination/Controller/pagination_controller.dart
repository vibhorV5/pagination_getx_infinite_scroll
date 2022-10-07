import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
  var lstTask = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  var isDataProcessing = false.obs;

//For pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  @override
  void onInit() {
    super.onInit();
    getTask(page);

    //For pagination
    paginateTask();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

//For pagination
  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        debugPrint("reached end");
        page++;
        getMoreTask(page);
      }
    });
  }

//Get more data
  void getMoreTask(var page) {
    try {
      TaskProvider().getTask(page).then((resp) {
        if (resp.isNotEmpty) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          Get.snackbar('Info', 'No more items to load',
              backgroundColor: Colors.deepOrange.withOpacity(0.8),
              snackPosition: SnackPosition.BOTTOM);
        }
        lstTask.addAll(resp);
      }, onError: (err) {
        isMoreDataAvailable(false);
        Get.snackbar('Error', err.toString(), backgroundColor: Colors.red);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      Get.snackbar('Exception', exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  //Fetch Data
  void getTask(var page) {
    try {
      isDataProcessing(true);
      TaskProvider().getTask(page).then((resp) {
        isDataProcessing(false);
        lstTask.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        Get.snackbar('Error', err.toString(), backgroundColor: Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      Get.snackbar('Error', exception.toString(), backgroundColor: Colors.red);
    }
  }
}

class TaskProvider extends GetConnect {
  //Fetch Data
  Future<List<dynamic>> getTask(var page) async {
    try {
      final response =
          await get("https://jsonplaceholder.typicode.com/posts?_page=$page");
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        return response.body;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
