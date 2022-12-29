import 'package:flutter/material.dart';
import 'package:mirror_mirror/pages/roastpage.dart';
import 'package:mirror_mirror/pages/complementpage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.3,
            child: Image.asset('assets/img/main_bg.png', fit: BoxFit.cover),
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
                      color: Colors.white70,
                      alignment: Alignment.center,
                      child: const Icon(Icons.account_circle_outlined,
                          color: Colors.black, size: 130)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Mirror, Mirror.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                    'Mirror, mirror, on the wall,\nyou sure look the fairest of them all.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic)),
                const SizedBox(
                  height: 25,
                ),
                const Text('How are we feeling today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.normal)),
                const SizedBox(
                  height: 20,
                ),
                SizedBox( //Complement Button
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplementPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text('✨ Complement me! ✨',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox( //Roast button
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoastPage()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('🔥 Roast me. 🔥',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                ),
              ]))
        ],
      ),
    ));
  }
}
