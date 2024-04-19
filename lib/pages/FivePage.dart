import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/User.dart';

class FivePage extends StatefulWidget {
  const FivePage({super.key});

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  final dio = Dio();
  List<User> users = [];
  bool isLoading = false;
  void getUser() async {
    isLoading = true;
    final response = await dio.get('https://jsonplaceholder.org/users');
    // Periksa status response
    if (response.statusCode == 200) {
      users = (response.data as List)
          .map((userJson) => User.fromJson({
                "id": userJson["id"],
                "name": userJson["firstname"],
                "address": userJson["address"]["city"],
                "gender": "ee"
              }))
          .toList();
      // Gunakan list<User>
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Terjadi kesalahan saat mengambil data
      print('Terjadi kesalahan: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  // Tambahkan Expanded di sini biar list view tau batasan sampai mana harus menentukan heighnya
                  child: Container(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        final User user = users[index];
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
                              // Aksi yang ingin Anda lakukan ketika item diklik
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
    );
  }
}
