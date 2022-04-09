import 'package:flutter/material.dart';
import 'package:tree_plenish_app/models/host_data.dart';
import 'package:tree_plenish_app/ui/host/drawer.dart';
import 'package:tree_plenish_app/ui/host/list.dart';


class HostHomeScreen extends StatelessWidget {
  const HostHomeScreen({Key? key, required this.data}) : super(key: key);

  final HostData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.schoolname)
      ),
      drawer: const HostDrawer(),
      body: ElevatedButton(
        child: const Text("List"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ListScreen(data: data),
            ),
          );
        }
      ),
    );
  }
}