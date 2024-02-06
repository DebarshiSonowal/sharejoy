import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sharejoy/Constants/assets.dart';
import 'package:sharejoy/Constants/routes.dart';
import 'package:sharejoy/Routing/navigator.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/constatnts.dart';
import '../../Widget/custom_text_field.dart';
import '../../Widget/success_pop_up.dart';

class AddCelebrationScreen extends StatefulWidget {
  const AddCelebrationScreen({super.key});

  @override
  State<AddCelebrationScreen> createState() => _AddCelebrationScreenState();
}

class _AddCelebrationScreenState extends State<AddCelebrationScreen> {
  final celebrationType = TextEditingController();
  final expectedSurplus = TextEditingController();
  final addItemsToDonate = TextEditingController();
  bool isChecked = false;
  String address = "", dateTime = "";

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
                  "Plan your celebration with purpose! Share event details and expected surplus food quantities to make every gathering a joyous opportunity for giving back.",
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
                  controller: celebrationType,
                  type: TextInputType.text,
                  hint: "Birthday, Wedding, etc",
                  fullname: "Celebration Type",
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  controller: expectedSurplus,
                  type: TextInputType.number,
                  hint: "No of persons",
                  fullname: "Expected Surplus",
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
                  height: 2.h,
                ),
                Text(
                  "Select Pickup Time and Date",
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
                    // Navigation.instance.navigate(Routes.pickAddressScreen);
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime.now().add(const Duration(days: 365)),
                        onChanged: (date) {}, onConfirm: (date) {
                      setState(() {
                        dateTime = DateFormat("EEEE, hh:mm aa  dd/MM/yyyy")
                            .format(date);
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
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
                          dateTime,
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
                  height: 2.h,
                ),
                CustomTextField(
                  controller: addItemsToDonate,
                  type: TextInputType.text,
                  hint: "Rice, Dal, Chicken, Paneer etc",
                  fullname: "Add Items to cart to donate",
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text.rich(
                  TextSpan(
                    text:
                        'By proceeding, you agree to our Terms and Conditions, ensuring responsible handling of surplus food and compliance with local regulations for a sustainable and impactful celebration. ',
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Read Now',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9.5.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
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
                          // showSuccess(context);
                          Navigation.instance.navigate(Routes.confirmFoodScreen);
                        },
                        child: Text(
                          'Create Celebration',
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
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigation.instance.goBack();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.5.sp,
                          // fontWeight: FontWeight.bold,
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


