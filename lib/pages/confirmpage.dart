import 'dart:io';

import 'package:flutter/material.dart';

import 'package:mirror_mirror/helpers/appcolors.dart';
import 'package:mirror_mirror/helpers/appconstants.dart';
import 'package:mirror_mirror/helpers/appstrings.dart';

class ConfirmPage extends StatelessWidget {
  final File image;
  const ConfirmPage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: AppColors.black,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Opacity(
                        opacity: 0.3,
                        child: Image.asset('assets/img/main_bg.png',
                            fit: BoxFit.cover,
                            color: AppColors.menuBackground,
                            colorBlendMode: BlendMode.color))),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(AppStrings.confirmTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const SizedBox(height: 15),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.cameraPadding),
                        child: Image.file(image, fit: BoxFit.cover))
                  ],
                ))
              ],
            )));
  }
}
