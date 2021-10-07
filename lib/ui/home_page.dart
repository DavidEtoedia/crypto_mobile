import 'package:crypto_mobile/ui/app_barr.dart';
import 'package:crypto_mobile/ui/top_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171520),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 40.w, right: 40.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const AppBarr(),
              SizedBox(
                height: 50.h,
              ),
              const TopDisplay(),
              SizedBox(
                height: 50.h,
              ),
              Container(
                height: 65.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65.r),
                    color: const Color(0xff262431)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search . . .',
                      hintStyle: GoogleFonts.asap(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
