import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharejoy/Constants/assets.dart';
import 'package:sharejoy/Constants/constatnts.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/routes.dart';
import '../../Routing/navigator.dart';
import '../../Storage/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        // padding: EdgeInsets.symmetric(
        //   horizontal: 2.w,
        //   vertical: 1.h,
        // ),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 100.h,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            Assets.bgImage,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    // color: Colors.white,
                    child: Image.asset(
                      Assets.bgImageBottom,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              width: double.infinity,
              height: 40.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      "Let's Make a Difference Together",
                      style: GoogleFonts.sora().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      "Transforming surplus into smiles",
                      style: GoogleFonts.sora().copyWith(
                        color: const Color(0xffA9A9A9),
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Constants.selected, // background
                        onPrimary: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        // foreground
                      ),
                      onPressed: () {
                        Navigation.instance.navigateAndRemoveUntil(Routes.registrationScreen);
                      },
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora().copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   if (Storage.instance.isLoggedIn) {
    //     Navigation.instance.navigateAndRemoveUntil(Routes.mainScreen);
    //   } else {
    //     Navigation.instance.navigateAndRemoveUntil(Routes.registrationScreen);
    //   }
    // });
  }
}
