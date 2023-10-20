import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.primary,
      body: Center(
        child: Image.asset(
          Images.logoWhite,
          width: 600.0,
        ),
      ),
    );
  }
}
