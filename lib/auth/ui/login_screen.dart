import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/auth/model/login_request_model.dart';
import 'package:task/auth/provider/auth_provider.dart';
import 'package:task/product/ui/screen/dashboard_screen.dart';
import 'package:task/utils/string_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = 'kminchelle';
    passwordController.text = '0lelplR';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: username,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return enterUserName;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: password,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return enterPassword;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          doLogin(context);
                        },
                        child: const Text(login),
                      ),
                    ],
                  ),
                ),
              ),
              if (authProvider.isLoading) const CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }

  Future<void> doLogin(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      final provider = Provider.of<AuthProvider>(context, listen: false);

      LoginRequest loginRequest = LoginRequest(
        name: nameController.text,
        password: passwordController.text,
      );

      bool success = await provider.doLogin(loginRequest);
      if (success && mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    }
  }
}
