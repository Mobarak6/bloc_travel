import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/src/shared/assets/assets.gen.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Padding(
      padding: const EdgeInsets.all(Dimensions.spacingGiant),
      child: Assets.images.splashImage.image(),
    )),
  );
}
