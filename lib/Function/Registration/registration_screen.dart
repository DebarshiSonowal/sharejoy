import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharejoy/Constants/routes.dart';
import 'package:sharejoy/Routing/navigator.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/constatnts.dart';
import '../../Widget/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  bool isChecked = false;

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
                  height: 3.h,
                ),
                CustomTextField(
                  controller: fullName,
                  type: TextInputType.name,
                  hint: "Enter your full name",
                  fullname: "Full Name",
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
                  controller: phone,
                  type: TextInputType.phone,
                  hint: "Enter your phone number",
                  fullname: "Phone Number",
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
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? val) {
                        setState(() {
                          isChecked = val ?? false;
                        });
                      },
                      checkColor: Colors.white,
                      fillColor: const MaterialStatePropertyAll(Colors.white12),
                    ),
                    SizedBox(
                      width: 80.w,
                      child: Text(
                        'By Creating account, you are accepting terms & conditions',
                        style: GoogleFonts.manrope().copyWith(
                          color: const Color(0xffF4F2F6),
                          // fontWeight: FontWeight.bold,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  ],
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
                          
                        },
                        child: Text(
                          'Register',
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
                      'Already have an account?',
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
                        Navigation.instance.navigate(Routes.signInScreen);
                      },
                      child: Text(
                        'Sign In',
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


