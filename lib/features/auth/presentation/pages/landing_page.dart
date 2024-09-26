import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/custom_button.dart';
import 'package:test_app/features/auth/presentation/pages/login_page.dart';
import 'package:test_app/features/auth/presentation/widgets/header_block_widget.dart';
import 'package:test_app/res/colors.dart';
import 'package:test_app/utils/helping_functions.dart';

class LandingPage extends StatelessWidget {
  static const routeName = '/landing-page';
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getDeviceWidth(context),
        height: getDeviceHeight(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.startColor,
              AppColors.midColor,
              AppColors.endColor,
            ],
            begin: Alignment.topLeft, // Starting point of the gradient
            end: Alignment.bottomRight, // Ending point of the gradient
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getDeviceHeight(context) * 0.1,
              ),
              Icon(
                Icons.mic,
                size: getDeviceHeight(context) * 0.1,
                color: AppColors.white,
              ),
              const HeaderBlockWidget(
                  welcomeText: 'WELCOME TO',
                  firstText: 'MUSIC',
                  secondText: 'APP'),
              SizedBox(
                height: getDeviceHeight(context) * 0.08,
              ),
              CustomElevatedButton(
                  backgroundColor: AppColors.white,
                  textColor: AppColors.black,
                  title: 'Login',
                  padding: EdgeInsets.symmetric(
                      horizontal: getDeviceWidth(context) * 0.1,
                      vertical: getDeviceHeight(context) * 0.01),
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  }),
              SizedBox(
                height: getDeviceHeight(context) * 0.015,
              ),
              CustomElevatedButton(
                  backgroundColor: AppColors.white,
                  textColor: AppColors.black,
                  title: 'Register',
                  padding: EdgeInsets.symmetric(
                      horizontal: getDeviceWidth(context) * 0.1,
                      vertical: getDeviceHeight(context) * 0.01),
                  onTap: () {
                    showSnackBar(context, 'Under development');
                  }),
              SizedBox(
                height: getDeviceHeight(context) * 0.1,
              ),
              Text('or quick login with',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: getFontSize(15, getDeviceWidth(context)),
                  )),
              Text('with Touch ID',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: getFontSize(15, getDeviceWidth(context)),
                  )),
              SizedBox(
                height: getDeviceHeight(context) * 0.1,
              ),
              IconButton(
                onPressed: () {
                  showSnackBar(context, 'Under development');
                },
                icon: Icon(
                  Icons.fingerprint,
                  color: AppColors.white,
                  size: getFontSize(69, getDeviceWidth(context)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
