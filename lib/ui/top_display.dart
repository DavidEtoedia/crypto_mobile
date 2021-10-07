import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDisplay extends StatelessWidget {
  const TopDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market Cap',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 15.h,
            ),
            Text('${1.7}b',
                style: GoogleFonts.asap(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text('BTC Dominance',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('24h Volume',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 15.h,
            ),
            Text('${1.7}b',
                style: GoogleFonts.asap(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text('BTC Dominance',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BTC Dominance',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 15.h,
            ),
            Text('${1.7}b',
                style: GoogleFonts.asap(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text('BTC Dominance',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
          ],
        ),
      ],
    );
  }
}
