// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/widgets/custom_text_field.dart';
import 'package:test_app/core/widgets/gridant_border_button.dart';
import 'package:test_app/core/widgets/gridant_button.dart';
import 'package:test_app/core/widgets/loader.dart';
import 'package:test_app/features/auth/presentation/pages/landing_page.dart';
import 'package:test_app/features/auth/presentation/widgets/gridant_icon.dart';
import 'package:test_app/res/colors.dart';
import 'package:test_app/utils/helping_functions.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Focus nodes
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  static const platform = MethodChannel(
      'com.example.test_app/api'); // Method channel for platform communication

  String _loginResponse = ''; // Variable to hold the login response

  // Method to invoke the API call
  Future<void> loginUser() async {
    try {
      showLoading(context);
      final Map<String, dynamic> body = {
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "device_token":
            "fake_deivce_token", // You can handle token generation here
        "device_type":
            "android" // Using android so sending android as device type
      };

      final String result = await platform.invokeMethod('loginUser', body);
      hideLoading(context);
      setState(() {
        _loginResponse = result; // Update the UI with the response
      });
    } on PlatformException catch (e) {
      hideLoading(context);
      setState(() {
        _loginResponse = "Failed to login: '${e.message}'."; // Error handling
      });
    } catch (e) {
      hideLoading(context);
      setState(() {
        _loginResponse = "Failed to login: '$e'."; // Error handling
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getDeviceHeight(context) * 0.1,
              ),
              Center(
                child: GradientIcon(
                    icon: Icons.mic,
                    size: getDeviceHeight(context) * 0.1,
                    gradient: const LinearGradient(colors: [
                      AppColors.startColor,
                      AppColors.midColor,
                      AppColors.endColor
                    ])),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.015,
              ),
              Text('SIGN IN',
                  style: TextStyle(
                      fontSize: getDeviceHeight(context) * 0.02,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600)),
              Text('TO CONTINUE',
                  style: TextStyle(
                      fontSize: getDeviceHeight(context) * 0.02,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              CustomTextField(
                borderRadius: 30,
                controller: _emailController,
                node: _emailFocusNode,
                hintTextMain: 'Enter your email',
                isPassword: false,
                backgroundColor: Colors.grey.shade100,
                borderActiveColor: AppColors.endColor,
                textColor: Colors.grey,
                activeTextColor: AppColors.endColor,
                textFieldTextColor: Colors.black,
                nextNode: _passwordFocusNode,
              ),

              // Password field
              CustomTextField(
                borderRadius: 30,
                controller: _passwordController,
                node: _passwordFocusNode,
                hintTextMain: 'Enter your password',
                isPassword: true,
                backgroundColor: Colors.grey.shade100,
                borderActiveColor: AppColors.endColor,
                textColor: Colors.grey,
                activeTextColor: AppColors.endColor,
                textFieldTextColor: Colors.black,
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              GradientButton(
                title: 'Log in',
                onTap: loginUser, // Trigger the login method
                borderRadius: 50,
                gradient: const LinearGradient(colors: [
                  AppColors.startColor,
                  AppColors.midColor,
                  AppColors.endColor
                ]),
              ),
              TextButton(onPressed: () {}, child: const Text("Lost Password?")),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              Container(
                height: 2,
                width: getDeviceWidth(context) * 0.3,
                color: AppColors.black,
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              Row(
                children: [
                  GradientBorderButton(
                      title: 'Facebook',
                      onTap: () {},
                      borderRadius: 50,
                      prefixIcon: Icons.facebook,
                      borderWidth: 4,
                      backgroundColor: AppColors.white,
                      textStyle: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.w600),
                      gradient: const LinearGradient(colors: [
                        AppColors.startColor,
                        AppColors.midColor,
                        AppColors.endColor
                      ])),
                  GradientBorderButton(
                      title: 'Google',
                      onTap: () {},
                      borderRadius: 50,
                      prefixIcon: Icons.telegram,
                      borderWidth: 4,
                      backgroundColor: AppColors.white,
                      textStyle: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.w600),
                      gradient: const LinearGradient(colors: [
                        AppColors.startColor,
                        AppColors.midColor,
                        AppColors.endColor
                      ]))
                ],
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              // Handle the social buttons and other UI components...
              Text('Login Response: $_loginResponse'), // Display login response
            ],
          ),
        ),
      ),
    );
  }
}
