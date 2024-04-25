import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/UserController.dart';
import 'package:flutter_application_1/models/User.dart';
import 'package:flutter_application_1/pages/SixPage.dart';
import 'package:get/get.dart';

class FivePage extends StatefulWidget {
  const FivePage({super.key});

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    userController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => userController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  // Tambahkan Expanded di sini biar list view tau batasan sampai mana harus menentukan heighnya
                  child: Container(
                    child: ListView.builder(
                      itemCount: userController.userList.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        final User user = userController.userList.value[index];
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            tileColor: const Color.fromARGB(255, 241, 150, 13),
                            title: Text(user.name ?? ''),
                            subtitle: Text(user.address ?? ''),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => null,
                            ),
                            onTap: () {
                              {
                                Get.to(SixPage(userId: user.id ?? 0));
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // ElevatedButton(onPressed: addUser, child: Text("Add Item")),
                SizedBox(height: 10),
              ],
            ),
    ));
  }
}
