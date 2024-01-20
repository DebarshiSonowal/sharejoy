import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharejoy/Constants/constatnts.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selected = 0;
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: Padding(
          padding: EdgeInsets.only(
            top: 6.h,
            left: 4.w,
            right: 4.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.raleway().copyWith(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 8.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Guwahati',
                        style: GoogleFonts.raleway().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 90.w,
                  height: 6.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 75.w,
                        height: 6.h,
                        child: TextField(
                          // controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search...',
                            hintStyle: GoogleFonts.raleway().copyWith(
                              color: Colors.black38,
                              // fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                            // Add a clear button to the search bar

                            // Add a search icon or button to the search bar
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                // Perform the search here
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Constants.linearFirst,
                              Constants.linearSecond,
                            ],
                          ),
                        ),
                        width: 12.w,
                        height: 5.5.h,
                        child: const Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you want to help',
                        style: GoogleFonts.raleway().copyWith(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        'See More',
                        style: GoogleFonts.raleway().copyWith(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 45.h,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = Constants.celebrations[index];
                      return Container(
                        padding: EdgeInsets.symmetric(
                          // horizontal: 6.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                            ).image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: 75.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 7.w,
                                // vertical: 8.h,
                              ),
                              color: Colors.black12,
                              height: 8.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: GoogleFonts.raleway().copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    item.title,
                                    style: GoogleFonts.raleway().copyWith(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 0.w,
                      );
                    },
                    itemCount: 4,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                  ),
                  height: 6.h,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = Constants.category[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Card(
                          child: Container(
                            decoration: selected == index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Constants.linearFirst,
                                        Constants.linearSecond,
                                      ],
                                    ),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                            width: 24.w,
                            child: Center(
                              child: Text(
                                item,
                                style: GoogleFonts.raleway().copyWith(
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black87,
                                  fontWeight: selected == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 8.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 2.w,
                      );
                    },
                    itemCount: Constants.category.length,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Near You',
                        style: GoogleFonts.raleway().copyWith(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        'See More',
                        style: GoogleFonts.raleway().copyWith(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = Constants.institutions[index];
                    return ListTile(
                      leading: Image.asset(
                        item.image,
                        fit: BoxFit.fill,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: GoogleFonts.raleway().copyWith(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            item.address,
                            style: GoogleFonts.raleway().copyWith(
                              color: Colors.white60,
                              // fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.white,
                                size: 10.sp,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                item.distance,
                                style: GoogleFonts.raleway().copyWith(
                                  color: Colors.white60,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 2.h,
                    );
                  },
                  itemCount: Constants.institutions.length,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.search,
          color: Constants.primaryColor,
          size: 20.sp,
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Constants.bottomBarColor,
        itemCount: Constants.icons.length,
        tabBuilder: (int index, bool isActive) {
          return Icon(
            Constants.icons[index],
            size: 24,
            color: isActive ? Constants.primaryColor : Colors.white60,
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
