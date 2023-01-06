import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:mirror_mirror/pages/confirmpage.dart';

import 'package:mirror_mirror/helpers/appcolors.dart';
import 'package:mirror_mirror/helpers/appconstants.dart';
import 'package:mirror_mirror/helpers/appstates.dart';
import 'package:mirror_mirror/helpers/appstrings.dart';

///Camera page where the user will be prompted to submit a photo to be
///complemented
class ComplementPage extends StatefulWidget {
  final List<CameraDescription> cameras; //need the cameras on the device
  const ComplementPage({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  _ComplementScreenState createState() => _ComplementScreenState();
}

class _ComplementScreenState extends State<ComplementPage> {
  @override
  void initState() {
    //we want to default to the front camera, which *should* be at
    //index 1 if there is more than 1 camera on the device
    if (widget.cameras.length > 1) {
      selectedCam = 1;
    }
    initializeCamera(selectedCam);
    super.initState();
  }

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int selectedCam = 0;
  List<File> capturedImages = [];

  initializeCamera(int camIndex) async {
    _controller =
        CameraController(widget.cameras[camIndex], ResolutionPreset.low);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: AppColors.black,
            child: Stack(children: [
              Positioned.fill(
                  child: Opacity(
                      opacity: 0.9,
                      child: Image.asset(
                        'assets/img/main_bg.png',
                        fit: BoxFit.cover,
                        color: AppColors.compBackground,
                        colorBlendMode: BlendMode.color,
                      ))),
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(AppStrings.compTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.cameraPadding),
                        child: FutureBuilder(
                            future: _initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CameraPreview(_controller);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            })),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  //take photo button
                                  onTap: () async {
                                    //take the picture
                                    await _initializeControllerFuture;
                                    var xFile = await _controller.takePicture();

                                    //the camera package returns a
                                    //cross-platform XFile, but we need to
                                    //convert this to a regular file for later
                                    //code
                                    File? image = File(xFile.path);

                                    //Dart gets mad if we don't check this.
                                    if (!mounted) {
                                      return;
                                    }

                                    //navigate to confirmation page
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmPage(image: image, state: AppState.complement,)));
                                  },
                                  child: ClipOval(
                                      child: Container(
                                          width: 60,
                                          height: 60,
                                          color: AppColors.white,
                                          child: const Icon(
                                              Icons.camera_alt_rounded,
                                              color: AppColors.black)))),
                            ]))
                  ]))
            ])));
  }
}
