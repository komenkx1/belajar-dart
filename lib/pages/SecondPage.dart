import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/User.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<User> userList = [
    // object json di convert agar dikenali sebaai object user
    User.fromJson({
      'id': 1,
      'name': 'Mang',
      'address': 'Gianyar',
      'gender': 'Pria',
    }),
    // ada cara lain nya yaitu langsung menggunakan model usernya.
    User(
      id: 2,
      name: "Mang2",
      address: "Gianyar2",
      gender: "Pria2",
    ),
  ];

  /*
  perbedaan 2 metode di atas adalah, cara dengan fromJson, cocok ketika ada data yg butuh pemrosesan, 
  contohnya data dari api memiliki field yg belum sesuai dengan object model user, maka pakai fromJson untuk memfilter
  field feild apa saja yg sesuai dengan model.

  cara kedua itu cocok kalau datanya sudah sesuai dari awal.
  */
  int idUser = 3;
  void addUser() {
    int counterId = idUser++;
    var newUser = User(
      id: counterId,
      name: "Mang ${counterId}",
      address: "Gianyar ${counterId}",
      gender: "Pria ${counterId}",
    );
    setState(() {
      userList.add(newUser);
    });
  }

  void removeUser(index) {
    setState(() {
      userList.removeAt(index);
    });
  }

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
