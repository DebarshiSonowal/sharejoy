import 'package:flutter/material.dart';
import 'package:sharejoy/Function/Dashboard/dashboard_screen.dart';
import 'package:sharejoy/Function/Registration/registration_screen.dart';

import '../Constants/routes.dart';
import '../Function/AddAddress/pick_address.dart';
import '../Function/AddCelebration/add_celebration.dart';
import '../Function/SignIn/sign_in_screen.dart';
import '../Function/SplashScreen/splash_screen.dart';
import '../Widget/fade_transition_page_builder.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return FadeTransitionPageRouteBuilder(page: const SplashScreen());
    case Routes.mainScreen:
      return FadeTransitionPageRouteBuilder(page: const DashboardScreen());
    case Routes.addCelebrationScreen:
      return FadeTransitionPageRouteBuilder(page: const AddCelebrationScreen());
    case Routes.pickAddressScreen:
      return FadeTransitionPageRouteBuilder(page: const PickAddressScreen());

    //
    case Routes.registrationScreen:
      return FadeTransitionPageRouteBuilder(page: const RegistrationScreen());
    case Routes.signInScreen:
      return FadeTransitionPageRouteBuilder(page: const SignInScreen());
    default:
      return FadeTransitionPageRouteBuilder(page: Container());
  }
}
