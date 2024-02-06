import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constants/assets.dart';
import '../Routing/navigator.dart';

class SuccessPopUp extends StatelessWidget {
  const SuccessPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff1A1919),
      content: Container(
        width: 80.w,
        height: 30.h,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.doneImage),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 70.w,
              child: Text(
                "Pickup Requested Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 65.w,
              child: Text(
                "You placed the pickup successfully. We will get closer within 45 minutes. Keep the food ready.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 9.sp,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: (){
                Navigation.instance.goBack();
              },
              child: Text(
                "Keep Browsing",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}