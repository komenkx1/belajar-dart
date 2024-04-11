import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/CInput.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                "Hello World"),
          ),
          ElevatedButton(onPressed: null, child: const Text("Go To SecondPage"))
        ],
      ),
    ));
  }
}
