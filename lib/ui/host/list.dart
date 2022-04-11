import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HostStateModel>(
      builder: (context, data, child) => Scaffold(
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
      ),
    );
  }
}