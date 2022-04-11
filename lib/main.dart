import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';
import 'package:tree_plenish_app/ui/host/accessportal.dart';
import 'package:tree_plenish_app/ui/host/home.dart';
import 'package:tree_plenish_app/ui/host/list.dart';
import 'package:tree_plenish_app/ui/host/login.dart';
import 'package:tree_plenish_app/ui/host/assignments.dart';
import 'package:tree_plenish_app/ui/host/eventpage.dart';
import 'package:tree_plenish_app/ui/landing_screen.dart';

void main() {
  runApp(const TreePlenishApp());
}

class TreePlenishApp extends StatelessWidget {
  const TreePlenishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HostStateModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LandingScreen(),
          '/host': (context) => const HostLoginScreen(),
          '/host/home': (context) => const HostHomeScreen(),
          '/host/list': (context) => const ListScreen(),
          '/host/assignments': (context) => const HostAssignmentsScreen(),
          '/host/eventpage': (context) => const EventPageScreen(),
          '/host/accessportal': (context) => const AccessPortalScreen(),
        },
        initialRoute: '/',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ),
        ),
      ),
    );
  }
}
