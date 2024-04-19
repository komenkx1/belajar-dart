import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  final List<String> doneModuleList;
  const FourPage({Key? key, required this.doneModuleList}) : super(key: key);

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context,
                widget
                    .doneModuleList); // Kembali ke ThirdPage dan kirimkan data terbaru
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.doneModuleList[index]),
            trailing: IconButton(icon: Icon(Icons.delete), onPressed: null),
          );
        },
        itemCount: widget.doneModuleList.length,
      ),
    );
  }
}
