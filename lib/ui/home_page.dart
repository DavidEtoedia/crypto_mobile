import 'package:crypto_mobile/ui/app_barr.dart';
import 'package:crypto_mobile/ui/screens/cryptolist.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/ui/top_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    return Scaffold(
      // backgroundColor: const Color(0xff171520),
      floatingActionButton: FloatingActionButton(
        child: isEnabled
            ? const Icon(
                Icons.dark_mode_outlined,
              )
            : const Icon(
                Icons.light_mode_outlined,
              ),
        onPressed: () {
          ref.read(appThemeStateProvider.notifier).toggleTheme();
        },
        backgroundColor: Colors.black,
      ),

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
                height: 30.h,
              ),
              const TopDisplay(),
              SizedBox(
                height: 50.h,
              ),
              const SearchBar(),
              SizedBox(
                height: 30.h,
              ),
              const CryptoList()
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends HookConsumerWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    return Container(
      height: 65.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65.r),
          color: isEnabled ? const Color(0xff262431) : Colors.grey[300]),
      child: Stack(
        children: [
          Positioned(
            left: 60.w,
            right: 0,
            bottom: 5.h,
            child: TextField(
              style: GoogleFonts.asap(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search . . .',
                  hintStyle: GoogleFonts.asap(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
            ),
          ),
          Positioned(
            left: 0.w,
            right: 250,
            bottom: 16.h,
            child: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          Positioned(
            left: 270.w,
            right: 0,
            bottom: 16.h,
            child: const Icon(
              Icons.tune_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
