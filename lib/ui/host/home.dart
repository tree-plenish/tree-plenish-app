import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';
import 'package:tree_plenish_app/ui/host/drawer.dart';


class HostHomeScreen extends StatelessWidget {
  const HostHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HostStateModel>(
      builder: (context, data, child) => Scaffold(
        appBar: AppBar(
          title: Text("${data.schoolid}")
        ),
        drawer: const HostDrawer(),
        body: const Text("Host Home"),
      ),
    );
  }
}