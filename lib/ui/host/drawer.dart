import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:tree_plenish_app/common/web_js_stub.dart'
    if (dart.library.html) 'package:tree_plenish_app/common/web_js.dart';
import 'package:tree_plenish_app/models/host_state.dart';

class HostDrawer extends StatelessWidget {
  const HostDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<HostStateModel>(
        builder: (context, data, child) => ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[200],
              ),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/host/home');
              },
            ),
            ListTile(
              title: const Text('Event Page'),
              onTap: () {
                Navigator.pop(context);
                if (defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android) {
                  Navigator.pushReplacementNamed(context, '/host/eventpage');
                } else if (defaultTargetPlatform == TargetPlatform.linux ||
                    defaultTargetPlatform == TargetPlatform.macOS ||
                    defaultTargetPlatform == TargetPlatform.windows) {
                  openPageInNewTab('http://tpevents.org/school/${data.schoolid}');
                }
              },
            ),
            ListTile(
              title: const Text('Access Portal'),
              onTap: () {
                Navigator.pop(context);
                if (defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android) {
                  Navigator.pushReplacementNamed(context, '/host/accessportal');
                } else if (defaultTargetPlatform == TargetPlatform.linux ||
                    defaultTargetPlatform == TargetPlatform.macOS ||
                    defaultTargetPlatform == TargetPlatform.windows) {
                  openPageInNewTab('http://treeplenishportal.com');
                }
              },
            ),
            ListTile(
              title: const Text('Event Day Assignments'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/host/assignments');
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
