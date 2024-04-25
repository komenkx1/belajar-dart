import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/User.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  final dio = Dio();
  late Rx<User> user;
  RxList<User> userList = <User>[].obs;
  RxBool isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();

  void getUsers() async {
    isLoading.value = true;
    final response = await dio.get('https://jsonplaceholder.org/users');
    // Periksa status response
    if (response.statusCode == 200) {
      userList = (response.data as List)
          .map((userJson) => User.fromJson({
                "id": userJson["id"],
                "name": userJson["firstname"],
                "address": userJson["address"]["city"],
                "gender": "ee"
              }))
          .toList()
          .obs;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      update();
      print('Terjadi kesalahan: ${response.statusCode}');
      // Terjadi kesalahan saat mengambil data
    }
  }

  void getUser(id) async {
    isLoading.value = true;
    final response =
        await dio.get('https://jsonplaceholder.org/users/${id.toString()}');
    // Periksa status response
    if (response.statusCode == 200) {
      user = User.fromJson({
        "id": response.data['id'],
        "name": response.data['firstname'],
        "address": response.data['address']['city'],
        "gender": "ee"
      }).obs;
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      update();
      print('Terjadi kesalahan: ${response.statusCode}');
      // Terjadi kesalahan saat mengambil data
    }
  }

  void updateUser(id) async {
    var responses = await dio.put(
        'https://jsonplaceholder.org/users/${id.toString()}',
        data: {'name': nameController.text});
    print(responses);
  }

  void storeUser() async {
    var responses = await dio.post('https://jsonplaceholder.org/users/',
        data: {'name': nameController.text});
    print(responses);
  }
}
