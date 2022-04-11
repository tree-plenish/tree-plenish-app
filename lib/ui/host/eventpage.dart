import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';
import 'package:tree_plenish_app/ui/host/drawer.dart';

class EventPageScreen extends StatefulWidget {
  const EventPageScreen({Key? key}) : super(key: key);

  @override
  State<EventPageScreen> createState() => _EventPageScreenState();
}

class _EventPageScreenState extends State<EventPageScreen> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<HostStateModel>(
      builder: (context, data, child) => Scaffold(
        appBar: AppBar(
          title: Text("${data.schoolid}")
        ),
        drawer: const HostDrawer(),
        body: Consumer<HostStateModel>(
          builder: (context, data, child) => WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: "http://tpevents.org/school/${data.schoolid.toString()}",
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            // onPageFinished: (_) { 
            //   controller.runJavascript(
            //     "document.getElementById('topnav').style.display = 'none'"
            //   );
            // },
            onProgress: (_) { 
              controller.runJavascript(
                """
                if(document.getElementById('topnav')) 
                  document.getElementById('topnav').style.display = 'none';
                """
              );
            },
          ),
        ),
      ),
    );
  }
}