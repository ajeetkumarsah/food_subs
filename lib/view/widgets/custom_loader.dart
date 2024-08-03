import 'package:flutter/material.dart';
import 'package:food_subs/utils/lottie_files.dart';
import 'package:lottie/lottie.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        LottieFiles.loading,
        width: 200,
        height: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
