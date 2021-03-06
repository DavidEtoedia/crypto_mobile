import 'package:crypto_mobile/ui/component/dismiss.dart';
import 'package:crypto_mobile/ui/screens/cryptolist.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/ui/trendinglist/trending_list.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_debounce_it/just_debounce_it.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    return DismissKeyboard(
      child: Scaffold(
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
            padding: EdgeInsets.only(left: 0.w, right: 0.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  // const AppBarr(),
                  SizedBox(
                    height: 30.h,
                  ),
                  // const TopDisplay(),

                  const SearchBar(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Text(
                      'Trending Coins',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const TrendingList(),

                  SizedBox(
                    height: 30.h,
                  ),
                  const CryptoList()
                ],
              ),
            ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 55.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(65.r),
            color: isEnabled ? const Color(0xff262431) : Colors.grey[300]),
        child: Stack(
          children: [
            Positioned(
              left: 70.w,
              right: 0,
              bottom: 0.h,
              child: TextField(
                style: GoogleFonts.asap(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search . . .',
                    hintStyle: GoogleFonts.asap(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                onChanged: (value) {
                  Debounce.seconds(1,
                      () => ref.read(allCoinProvider.notifier).searchby(value));
                },
                onEditingComplete: () => FocusScope.of(context).unfocus(),
              ),
            ),
            Positioned(
              left: 0.w,
              right: 250,
              bottom: 14.h,
              child: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
