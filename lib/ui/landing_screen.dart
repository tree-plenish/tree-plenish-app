import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tree Plenish App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Choose your role:"),
              SizedBox(height: 20),
              RoleButton(
                buttonText: "Host",
                buttonRoute: "/host",
              ),
              SizedBox(height: 20),
              RoleButton(
                buttonText: "Volunteer",
                buttonRoute: "/host",
              ),
              SizedBox(height: 20),
              RoleButton(
                buttonText: "Participant",
                buttonRoute: "/host",
              ),
            ],
          ),
        ),
      );
  }
}



class RoleButton extends StatelessWidget {
  final String buttonText;
  final String buttonRoute;

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
        Navigator.pushReplacementNamed(context, buttonRoute);
      },
    );
  }
}