import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarr extends HookConsumerWidget {
  const AppBarr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
              ],
              shape: BoxShape.circle,
              color: isEnabled ? const Color(0xff201f28) : Colors.grey[300]),
          child: Icon(
            Icons.chevron_left_outlined,
            color: isEnabled ? Colors.white : Colors.black,
          ),
        ),
        Text('Live prices',
            style: GoogleFonts.asap(
                color: isEnabled ? Colors.white : Colors.black,
                fontSize: 23.sp,
                fontWeight: FontWeight.w400)

            // TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
              ],
              shape: BoxShape.circle,
              color: isEnabled ? const Color(0xff201f28) : Colors.grey[300]),
          child: Icon(
            Icons.notifications_outlined,
            color: isEnabled ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}
