import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.fullname,
    required this.type,
  });

  final TextEditingController controller;
  final String hint, fullname;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullname,
          style: GoogleFonts.manrope().copyWith(
            color: const Color(0xffD9D9D9),
            fontWeight: FontWeight.bold,
            fontSize: 9.5.sp,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
          child: TextField(
            keyboardType: type,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.7.sp,
                  color: const Color(0xff4d4d4d),
                ),
                //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.7.sp, color: Color(0xff333333)),
                //<-- SEE HERE
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: hint,
              hintStyle: GoogleFonts.manrope().copyWith(
                color: const Color(0xffcfcfcf),
                // fontWeight: FontWeight.bold,
                fontSize: 8.5.sp,
              ),
            ),
            cursorColor: Colors.white38,
            style: GoogleFonts.manrope().copyWith(
              color: const Color(0xffD9D9D9),
              // fontWeight: FontWeight.bold,
              fontSize: 9.5.sp,
            ),
          ),
        )
      ],
    );
  }
}