import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharejoy/Constants/constatnts.dart';
import 'package:sharejoy/Routing/navigator.dart';
import 'package:sharejoy/Widget/success_pop_up.dart';
import 'package:sizer/sizer.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../Constants/routes.dart';

class ConfirmFoodScreen extends StatefulWidget {
  const ConfirmFoodScreen({super.key});

  @override
  State<ConfirmFoodScreen> createState() => _ConfirmFoodScreenState();
}

class _ConfirmFoodScreenState extends State<ConfirmFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: Container(
          // color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              Text(
                "My Cart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 2.h,
          ),
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              ListviewSectionConfirmFood(),
              FixedSectionConfirmFood(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListviewSectionConfirmFood extends StatelessWidget {
  const ListviewSectionConfirmFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
      ),
      height: 42.h,
      width: double.infinity,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return SwipeableTile.card(
            onSwiped: (direction) {
              // Here call setState to update state
            },
            backgroundBuilder: (context, direction, progress) {
              if (direction == SwipeDirection.endToStart) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1.w,
                          vertical: 1.w,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            border: Border.all(
                              color: Colors.red,
                            )),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (direction == SwipeDirection.startToEnd) {
                // return your widget
                return Container();
              }
              return Container();
            },
            // shape: RoundedRectangleBorder(
            //   side: const BorderSide(color: Colors.white70, width: 1),
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            color: Colors.black,
            key: Key(index.toString()),
            horizontalPadding: 16,
            verticalPadding: 8,
            direction: SwipeDirection.horizontal,
            shadow: BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 0.5.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 1.w,
                vertical: 1.w,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Constants.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 13.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 23.5.w,
                    height: 11.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          "https://media.istockphoto.com/id/1323876383/photo/traditional-indian-chicken-curry-top-down-close-up-photo.jpg?s=1024x1024&w=is&k=20&c=wpYuQZQYCKPCVkrcOCYNiZx20N6NCTmtv3NlGtx-KKo=",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rice",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                      ),
                      Text(
                        "Qty: 4",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         border: Border.all(
                  //           color: Constants.primaryColor,
                  //         ),
                  //       ),
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 1.w,
                  //       ),
                  //       child: Row(
                  //         crossAxisAlignment:
                  //             CrossAxisAlignment.center,
                  //         children: [
                  //           GestureDetector(
                  //             onTap: () {},
                  //             child: Icon(
                  //               Icons.remove,
                  //               color: Colors.red,
                  //               size: 13.sp,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 8.w,
                  //             child: Center(
                  //               child: Text(
                  //                 "1",
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodyLarge
                  //                     ?.copyWith(
                  //                       color: Colors.white,
                  //                     ),
                  //               ),
                  //             ),
                  //           ),
                  //           GestureDetector(
                  //             onTap: () {},
                  //             child: Icon(
                  //               Icons.add,
                  //               color: Colors.red,
                  //               size: 13.sp,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 1.h,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 0.5.h,
          );
        },
        itemCount: 4,
      ),
    );
  }
}

class FixedSectionConfirmFood extends StatelessWidget {
  const FixedSectionConfirmFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      width: double.infinity,
      // height: 40.h,
      child: Column(
        children: [
          const Divider(
            color: Constants.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: Text(
                    "Item Count",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: Text(
                    "2 nos",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: Text(
                    "Item Count",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: Text(
                    "2 nos",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: Text(
                    "Pickup",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.green,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: Text(
                    "Free",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.green,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                     ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Constants.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: Text(
                    "Total Items",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: Text(
                    "2 nos",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Constants.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60.w,
                  child: Text(
                    "Pickup From: Home",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: Text(
                    "Change",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
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
                    showSuccess(context);
                    // Navigation.instance.navigate(Routes.confirmFoodScreen);
                  },
                  child: Text(
                    'Confirm',
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
    );
  }

  void showSuccess(BuildContext context) {
    showDialog(context: context, builder: (context){
      return const SuccessPopUp();
    });
  }
}
