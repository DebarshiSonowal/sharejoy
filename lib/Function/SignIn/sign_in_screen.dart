import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharejoy/Constants/routes.dart';
import 'package:sharejoy/Routing/navigator.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/constatnts.dart';
import '../../Widget/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register Account',
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
                  'Join our food donation community by registering here and help us share meals with those in need',
                  style: GoogleFonts.manrope().copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 9.5.sp,
                  ),
                ),
                SizedBox(
                  height: 2.h,
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
                  height: 1.h,
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
                        onPressed: () {
                          Navigation.instance.navigate(Routes.mainScreen);
                        },
                        child: Text(
                          'Sign In',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.manrope().copyWith(
                        color: const Color(0xffF4F2F6),
                        // fontWeight: FontWeight.bold,
                        fontSize: 9.sp,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigation.instance.navigate(Routes.registrationScreen);
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.manrope().copyWith(
                          color: Constants.primaryColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
