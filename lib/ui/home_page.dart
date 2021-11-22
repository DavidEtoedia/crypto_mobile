import 'package:crypto_mobile/core/model/trending_coin.dart';
import 'package:crypto_mobile/ui/app_barr.dart';
import 'package:crypto_mobile/ui/screens/cryptolist.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/ui/vm/trending_coin_vm.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:just_debounce_it/just_debounce_it.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const AppBarr(),
              SizedBox(
                height: 30.h,
              ),
              // const TopDisplay(),

              const SearchBar(),
              SizedBox(
                height: 40.h,
              ),
              const Text(
                'Trending Coins',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 28.h,
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
              onChanged: (value) {
                Debounce.seconds(1,
                    () => ref.read(allCoinProvider.notifier).searchby(value));
              },
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
        ],
      ),
    );
  }
}

class TrendingList extends HookConsumerWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(trendingCoinProvider);
    return vm.when(idle: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, success: (value) {
      return SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: value!.coins!.length,
          itemBuilder: (context, index) {
            final coin = value.coins![index];
            return TrendingCardBuild(coin: coin.item!);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 20,
            );
          },
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Text(error.toString());
    });
  }
}

class TrendingCardBuild extends HookConsumerWidget {
  final Item coin;
  const TrendingCardBuild({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    var format = NumberFormat("###,###.0", "en_US");
    double d = coin.priceBtc!.toDouble();
    String number = d.toStringAsFixed(10);
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 5, right: 6),
      child: Container(
        width: 200,
        height: 0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: Offset(-3, 1))
            ],
            color: isEnabled ? const Color(0xff201f28) : Colors.grey[200]),
        child: Container(
          margin: const EdgeInsets.all(15),
          // color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Image.network(coin.small!),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(coin.name.toString())
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(number),

              Padding(
                padding: const EdgeInsets.only(left: 100, top: 10),
                child: Container(
                    height: 20,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.greenAccent[400]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rank",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          coin.score.toString(),
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              ),

              // Text(coin.score.toString())
            ],
          ),
        ),
      ),
    );
  }
}
