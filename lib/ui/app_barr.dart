import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarr extends StatelessWidget {
  const AppBarr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
          ], shape: BoxShape.circle, color: Color(0xff201f28)),
          child: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.white,
          ),
        ),
        Text('Live prices',
            style: GoogleFonts.asap(
                color: Colors.white,
                fontSize: 23.sp,
                fontWeight: FontWeight.w400)

            // TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
        Container(
          height: 60.h,
          width: 60.w,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
          ], shape: BoxShape.circle, color: Color(0xff201f28)),
          child: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
