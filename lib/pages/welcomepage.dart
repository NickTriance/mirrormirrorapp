import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:mirror_mirror/helpers/appcolors.dart';
import 'package:mirror_mirror/helpers/appstrings.dart';

import 'package:mirror_mirror/pages/complementpage.dart';
import 'package:mirror_mirror/pages/roastpage.dart';

class WelcomePage extends StatelessWidget {
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
            child: Image.asset(
              'assets/img/main_bg.png',
              fit: BoxFit.cover,
              color: AppColors.menuBackground,
              colorBlendMode: BlendMode.color,
            ),
          )),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                ClipOval(
                  child: Container(
                      width: 180,
                      height: 180,
                      color: AppColors.offWhite,
                      alignment: Alignment.center,
                      child: const Icon(Icons.account_circle_outlined,
                          color: AppColors.black, size: 160)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(AppStrings.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 25,
                ),
                const Text(AppStrings.slogan,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic)),
                const SizedBox(
                  height: 25,
                ),
                const Text(AppStrings.mainPrompt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.normal)),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  //Complement Button
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        loadCompPage(context);
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplementPage()));
                                */
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.compButton),
                      child: const Text(AppStrings.compBtnTxt,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  //Roast button
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        loadRoastPage(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.roastButton),
                      child: const Text(AppStrings.roastBtnTxt,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                ),
              ]))
        ],
      ),
    ));
  }

  //todo: idk if this is the best way to do this
  void loadRoastPage(context) async {
    final cameras = await availableCameras();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RoastPage(cameras: cameras)));
  }

  void loadCompPage(context) async {
    final cameras = await availableCameras();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ComplementPage(cameras: cameras)));
  }
}
