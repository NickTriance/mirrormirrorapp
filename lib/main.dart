import 'package:flutter/material.dart';
import 'package:mirror_mirror/helpers/appcolors.dart';
import 'pages/welcomepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(duration: 3, goToPage: WelcomePage())));
}

//todo: upon reading up this looks like it's just a janky way of accomplishing this.
//todo: would be better to set splash screen per platform
//todo: see https://docs.flutter.dev/development/ui/advanced/splash-screen
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
        //todo: pressing back from the main page breaks it.
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
        body: Container(
            color: AppColors.offBlack,
            alignment: Alignment.center,
            child: const Icon(Icons.account_circle_rounded,
                color: AppColors.white, size: 100)));
  }
}