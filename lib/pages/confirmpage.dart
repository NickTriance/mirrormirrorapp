import 'dart:ffi';
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
                        child: Image.file(image, fit: BoxFit.cover)),
                    //todo: align to bottom
                    Positioned(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //cancel button.
                                SizedBox(
                                  height: 45,
                                  width: 200,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.cancelBtn),
                                      onPressed: () {
                                        //todo: go back to previous screen
                                      },
                                      child: const Text(
                                          AppStrings.confirmNoBtnTxt,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                    height: 45,
                                    width: 200,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.confirmBtn),
                                        onPressed: () {},
                                        child: const Text(
                                          AppStrings.confirmYesBtnTxt,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )))
                              ],
                            )),
                      ),
                    )
                  ],
                ))
              ],
            )));
  }
}
