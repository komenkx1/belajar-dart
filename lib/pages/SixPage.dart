import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/UserController.dart';
import 'package:get/get.dart';

class SixPage extends StatefulWidget {
  final int userId;

  const SixPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        try {
          userController = Get.find<UserController>();
        } catch (e) {
          userController = Get.put(UserController());
        }
        userController.getUser(widget.userId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (userController.isLoading.value) {
            return LoadingWidget();
          }
          final user = userController.user.value;
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Form User"),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    TextField(
                      controller: userController.nameController
                        ..text = user.name ?? '', // Pre-fill with user data
                    ),
                    ElevatedButton(
                        onPressed: () => userController.updateUser(user),
                        child: Text("Submit"))
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// Create a separate widget for loading state (optional but recommended)
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
