import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/ModuleList.dart';
import 'package:flutter_application_1/pages/FourPage.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memulai Pemrograman Dengan Dart'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () async {
              //menerima data state yang sudah di perbaharui dari four page dan di simpan di result variable
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FourPage(doneModuleList: doneModuleList),
                ),
              );

              // Perbarui state jika hasil dari navigasi berisi data yang diperlukan
              if (result != null) {
                setState(() {
                  doneModuleList = result;
                });
              }
            },
          ),
        ],
      ),
      body: ModuleList(doneModuleList: doneModuleList),
    );
  }
}
