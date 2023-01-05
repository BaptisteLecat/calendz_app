import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:calendz_app/presentation/app/app_route.dart';

class DoneProfileSetupScreen extends StatefulWidget {
  const DoneProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<DoneProfileSetupScreen> createState() => _DoneProfileSetupScreenState();
}

class _DoneProfileSetupScreenState extends State<DoneProfileSetupScreen> {
  @override
  void initState() {
    _startTimerBeforeRedirect();
    super.initState();
  }

  _startTimerBeforeRedirect() async {
    await Future.delayed(const Duration(seconds: 3), () {
      context.go("${AppRoute.home.path}/0");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/animatedIcons/rocket.gif",
            height: 340,
          ),
          Text(
            "Félicitations ton compte est en cours de création !",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      )),
    );
  }
}
