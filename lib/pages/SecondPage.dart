import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/User.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<User> userList = [];

  void addUser() {}

  void removeUser(index) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // Tambahkan Expanded di sini biar list view tau batasan sampai mana harus menentukan heighnya
            child: Container(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = userList[index];
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
                        onPressed: () => removeUser(index),
                      ),
                      onTap: () {
                        // Aksi yang ingin Anda lakukan ketika item diklik
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: addUser, child: Text("Add Item")),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
