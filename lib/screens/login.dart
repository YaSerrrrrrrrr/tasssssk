import 'package:fashion/components/custom_button.dart';
import 'package:fashion/Color/colors.dart';
import 'package:fashion/components/custom_text_field.dart';
import 'package:fashion/components/header.dart';
import 'package:flutter/material.dart';
import 'package:fashion/utils/shared_preferences_helper.dart';
import 'package:gap/gap.dart';
import 'homepage.dart';
import 'package:fashion/components/custom_appbar.dart';


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
      appBar: CustomAppbar(
        
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(50),
              Header(name: "Login"),
              Gap(100),
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
            Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

