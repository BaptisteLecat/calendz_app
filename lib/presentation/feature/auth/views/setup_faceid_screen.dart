import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calendz_app/constants/constants.dart';

class SetupFaceIdScreen extends StatelessWidget {
  const SetupFaceIdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How to set up Face ID",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "First, positiion your face in the camera frame. The move your head in a circle to show all the angles of your face.",
              ),
              const Spacer(),
              Center(
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? "assets/Illustration/faceId.png"
                      : "assets/Illustration/faceId_dark.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/FaceId.svg",
                  color: Colors.white,
                ),
                label: const Text("Set up Faceid"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
