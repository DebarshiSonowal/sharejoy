import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharejoy/Constants/routes.dart';
import 'package:sharejoy/Routing/navigator.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/constatnts.dart';
import '../../Widget/custom_text_field.dart';

class AddCelebrationScreen extends StatefulWidget {
  const AddCelebrationScreen({super.key});

  @override
  State<AddCelebrationScreen> createState() => _AddCelebrationScreenState();
}

class _AddCelebrationScreenState extends State<AddCelebrationScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool isChecked = false;
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 2.h,
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create a Celebration',
                  style: GoogleFonts.manrope().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Sign in to your account and continue making a positive impact through our food donation app.',
                  style: GoogleFonts.manrope().copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 9.5.sp,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextField(
                  controller: email,
                  type: TextInputType.emailAddress,
                  hint: "Enter your mail",
                  fullname: "Email",
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  controller: password,
                  type: TextInputType.visiblePassword,
                  hint: "Enter your password",
                  fullname: "Password",
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Address",
                  style: GoogleFonts.manrope().copyWith(
                    color: const Color(0xffD9D9D9),
                    fontWeight: FontWeight.bold,
                    fontSize: 9.5.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigation.instance.navigate(Routes.pickAddressScreen);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff4d4d4d),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    height: 5.h,
                    child: Row(
                      children: [
                        Text(
                          address,
                          style: GoogleFonts.manrope().copyWith(
                            color: const Color(0xffD9D9D9),
                            fontWeight: FontWeight.bold,
                            fontSize: 9.5.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 5.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Constants.primaryColor, // background
                          onPrimary: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          // foreground
                        ),
                        onPressed: () {},
                        child: Text(
                          'Creation Celebration',
                          style: GoogleFonts.sora().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
