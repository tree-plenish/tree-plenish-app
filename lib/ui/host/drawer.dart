import 'package:flutter/material.dart';

class HostDrawer extends StatelessWidget {
  const HostDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
              Navigator.pushReplacementNamed(context, '/host/eventpage');
            },
          ),
          ListTile(
            title: const Text('Access Portal'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/host/accessportal');
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
    );
  }
}