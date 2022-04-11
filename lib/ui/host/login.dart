import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';

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
                  if (int.tryParse(value) == null) {
                    return 'School ID must be an integer';
                  }
                  return null;
                },
                controller: schoolIdController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
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
                    // check with database to get school data
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text(schoolIdController.text + " " + passcodeController.text)),
                    // );
                    // // navigate to next page
                    Provider.of<HostStateModel>(context, listen: false)
                        .setSchoolId(int.parse(schoolIdController.text));
                    Navigator.pushReplacementNamed(context, '/host/home');
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
