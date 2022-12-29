import 'package:flutter/material.dart';
import 'pages/welcomepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(duration: 3, goToPage: WelcomePage())));
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
        body: Container(
            color: Colors.grey[900],
            alignment: Alignment.center,
            child: const Icon(Icons.account_circle_rounded,
                color: Colors.white, size: 100)));
  }
}



/*
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera_screen.dart';
//import 'home_screen.dart'

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //ensure plugins are initialized
  final cameras =
      await availableCameras(); //get a list of cameras on the device
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror, Mirror',
      //home: HomePage(title: 'home'),
      home: CameraScreen(cameras: cameras),
    );
  }
}
*/