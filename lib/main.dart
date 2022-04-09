import 'package:flutter/material.dart';
import 'package:tree_plenish_app/ui/host/login.dart';

void main() {
  runApp(const TreePlenishApp());
}

class TreePlenishApp extends StatelessWidget {
  const TreePlenishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tree Plenish App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Choose your role:"),
              const SizedBox(height: 20),
              RoleButton(
                buttonText: "Host",
                buttonRoute: (_) => const HostLoginScreen(),
              ),
              const SizedBox(height: 20),
              RoleButton(
                buttonText: "Volunteer",
                buttonRoute: (_) => const HostLoginScreen(),
              ),
              const SizedBox(height: 20),
              RoleButton(
                buttonText: "Participant",
                buttonRoute: (_) => const HostLoginScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String buttonText;
  final Widget Function(BuildContext) buttonRoute;

  const RoleButton({
    Key? key,
    required this.buttonText,
    required this.buttonRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        // height: 70,
        width: 200,
        alignment: Alignment.center,
        child: Text(buttonText),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: buttonRoute,
          ),
        );
      },
    );
  }
}