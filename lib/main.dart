import 'package:flutter/material.dart';

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

class HostLoginScreen extends StatefulWidget {
  const HostLoginScreen({Key? key}) : super(key: key);

  @override
  State<HostLoginScreen> createState() => _HostLoginScreenState();
}

class _HostLoginScreenState extends State<HostLoginScreen> {
  final formKey = GlobalKey<FormState>();
  final schoolIdController = TextEditingController();
  final passcodeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    schoolIdController.dispose();
    passcodeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter School ID',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 4) {
                    return 'School ID must be 4 characters long.';
                  }
                  return null;
                },
                controller: schoolIdController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Passcode',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a passcode.';
                  }
                  return null;
                },
                controller: passcodeController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (formKey.currentState!.validate()) {
                    // check with database
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(schoolIdController.text + " " + passcodeController.text)),
                    );
                    // // navigate to next page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const HostHomeScreen(),
                    //   ),
                    // );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HostHomeScreen extends StatelessWidget {
  const HostHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(
        child: Text("Drawer"),
      ),
      body: const Text("Body"),
    );
  }
}