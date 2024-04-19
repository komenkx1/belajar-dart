import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CInput.dart';
import 'package:flutter_application_1/pages/FivePage.dart';
import 'package:flutter_application_1/pages/SecondPage.dart';
import 'package:flutter_application_1/pages/ThirdPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int counter = 0;

  void addCounter() {
    counter++;
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                "Hello World ${counter}"),
          ),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SecondPage();
                    }))
                  },
              child: const Text("Go To Second Page")),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThirdPage();
                    }))
                  },
              child: const Text("Go To Third Page")),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FivePage();
                    }))
                  },
              child: const Text("Go To Five Page")),
          ElevatedButton(
              onPressed: () => addCounter(),
              child: const Text("Tambah Counter"))
        ],
      ),
    ));
  }
}
