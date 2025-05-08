import 'package:fashion/components/custom_button.dart';
import 'package:fashion/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:fashion/utils/shared_preferences_helper.dart';
import 'homepage.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<bool> validateUser() async {
    final userData = await SharedPreferencesHelper.getUserData();
    return emailController.text == userData['email'] &&
        passwordController.text == userData['password'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                label: 'Password',
                controller: passwordController,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Login",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    final isValid = await validateUser();
                    if (isValid) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid credentials")),
                      );
                    }
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

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white), // Ensure text is white
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey), // Label text color
        border: OutlineInputBorder(),
      ),
    );
  }
}