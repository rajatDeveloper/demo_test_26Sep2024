import 'package:flutter/material.dart';
import 'package:test_app/res/colors.dart';
import 'package:test_app/utils/helping_functions.dart';

class HeaderBlockWidget extends StatelessWidget {
  final String welcomeText;
  final String firstText;
  final String secondText;
  const HeaderBlockWidget(
      {super.key,
      required this.welcomeText,
      required this.firstText,
      required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            welcomeText,
            style: TextStyle(
                color: AppColors.white,
                fontSize: getFontSize(14, getDeviceWidth(context)),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: getDeviceWidth(context) * 0.001),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                firstText,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: getFontSize(25, getDeviceWidth(context)),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                secondText,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: getFontSize(25, getDeviceWidth(context)),
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
