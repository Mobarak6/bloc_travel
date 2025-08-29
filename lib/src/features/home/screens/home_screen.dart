import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/features/auth/screens/registration_screen.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';
import 'package:travel_app/src/travel_ap_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:context.l10n.home),
      body: Center(
        child: Column(children: [

          ElevatedButton.icon(
            onPressed: (){
              context.pushRoute(const LoginRoute());
            },
            label: Text(context.l10n.login),
          ),
          const SizedBox(height: Dimensions.fontSizeDefault),

          ElevatedButton.icon(
            onPressed: (){
              context.pushRoute(const RegistrationRoute());

            },
            label: Text(context.l10n.registration),
          ),

        ]),
      ),

    );
  }
}
