import 'package:fashion/components/custom_appbar.dart';
import 'package:fashion/components/custom_button.dart';
import 'package:fashion/components/custom_text.dart';
import 'package:fashion/components/custom_text_field.dart';
import 'package:fashion/components/header.dart';
import 'package:fashion/Color/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'login.dart';
import 'package:fashion/utils/shared_preferences_helper.dart';




class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(name: "Register"),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'First Name',
                          controller: firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: 'Last Name',
                          controller: lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Last name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  Gap(30),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Gap(30),
                  CustomTextField(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  Gap(30),
                  CustomTextField(
                    label: 'Phone Number',
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }
                      if (value.length < 5) {
                        return 'Enter a valid phone number > 5 numbers';
                      }
                      if (!RegExp(r'\d').hasMatch(value)) {
                        return 'Enter a valid phone number ';
                      }
                      return null;
                    },
                  ),
                  Gap(50),
                  Container(
                    color: Colors.black26,
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                    },
                     child: CustomText(text: "you have an account? Login",color: Colors.white,)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "Register",
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await SharedPreferencesHelper.saveUserData(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    phone: phoneController.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                }
              },
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}