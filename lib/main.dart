import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import 'Constants/constatnts.dart';
import 'Routing/navigator.dart';
import 'Routing/router.dart';
import 'Storage/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.instance.initializeStorage();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Travel Buddy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Constants.primaryColor,
            background: Constants.backgroundColor,
          ),
          useMaterial3: true,
        ),
        navigatorKey: Navigation.instance.navigatorKey,
        onGenerateRoute: generateRoute,
      );
    });
  }
}
