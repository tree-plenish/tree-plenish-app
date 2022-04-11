import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';
import 'package:tree_plenish_app/ui/host/drawer.dart';

class AccessPortalScreen extends StatefulWidget {
  const AccessPortalScreen({Key? key}) : super(key: key);

  @override
  State<AccessPortalScreen> createState() => _AccessPortalScreenState();
}

class _AccessPortalScreenState extends State<AccessPortalScreen> {
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
            initialUrl: "http://www.treeplenishportal.com/",
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            onPageFinished: (_) {
              controller.runJavascript(
                """
                var input = document.getElementsByTagName("input")[0];
                var nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "value").set;
                nativeInputValueSetter.call(input, ${data.schoolid.toString()});

                var ev2 = new Event('input', { bubbles: true});
                input.dispatchEvent(ev2);

                input = document.getElementsByTagName("input")[1];
                var nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "value").set;
                nativeInputValueSetter.call(input, ${data.password});

                var ev2 = new Event('input', { bubbles: true});
                input.dispatchEvent(ev2);
                document.getElementsByTagName('button')[0].click();
                """
              );
            },
          ),
        ),
      ),
    );
  }
}