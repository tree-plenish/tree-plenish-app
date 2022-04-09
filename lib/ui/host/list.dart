import 'package:flutter/material.dart';
import 'package:tree_plenish_app/models/host_data.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({ Key? key, required this.data}) : super(key: key);

  final HostData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Items'),
      ),
      body: ListView.builder(
        itemCount: data.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data.list[index]),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DetailScreen(data: data.list[index]),
            //     ),
            //   );
            // },
          );
        },
      ),
    );
  }
}