import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/ui/vm/coin_by_id.dart';
import 'package:crypto_mobile/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:spine_project/utils/navigator.dart';

class CoinDisplayScreen extends HookConsumerWidget {
  final String coinById;
  const CoinDisplayScreen({required this.coinById, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(coinByIdProvider(coinById));
    return Scaffold(
        backgroundColor: const Color(0xff171520),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                DisplayScreenBar(coinById),
                SizedBox(
                  height: 40.h,
                ),
                vm.when(
                  data: (data) {
                    return Text(data.marketData!.priceChange24H.toString(),
                        style: GoogleFonts.asap(
                            color: Colors.white,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400));
                  },
                  error: (Object error, StackTrace? stackTrace,
                      AsyncData<CoinById>? previous) {
                    print(error);
                    return Text(error.toString());
                  },
                  loading: (AsyncValue<CoinById>? previous) {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(
                  height: 70.h,
                ),
                vm.when(
                  data: (data) {
                    final List<Ticker> tickers = <Ticker>[
                      Ticker(
                        last: data.marketData!.priceChangePercentage30D,
                      ),
                      Ticker(
                          lastTradedAt: DateTime.tryParse(
                              data.lastUpdated!.toIso8601String())),
                      Ticker(
                          lastTradedAt: DateTime.tryParse(
                              data.lastUpdated!.toIso8601String()))
                    ];
                    return Container(
                      height: 400.h,
                      width: 350.w,
                      child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <LineSeries<Ticker, dynamic>>[
                            LineSeries<Ticker, dynamic>(
                                dataSource: tickers,
                                xValueMapper: (Ticker ticker, _) =>
                                    ticker.lastTradedAt,
                                yValueMapper: (Ticker ticker, _) =>
                                    ticker.last),
                          ]),
                    );
                  },
                  error: (Object error, StackTrace? stackTrace,
                      AsyncData<CoinById>? previous) {
                    print(error);
                    return Text(error.toString());
                  },
                  loading: (AsyncValue<CoinById>? previous) {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                // Container(
                //   height: 400.h,
                //   width: 350.w,
                //   child: SfCartesianChart(
                //     series: <LineSeries<Ticker, String>>[
                //       LineSeries<Ticker, String>(
                //         dataSource: <Ticker>[
                //           Ticker(market: )

                //         ],
                //         xValueMapper: xValueMapper,
                //         yValueMapper: yValueMapper)
                //     ]
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}

class DisplayScreenBar extends HookConsumerWidget {
  final String coin;
  const DisplayScreenBar(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(coinByIdProvider(coin));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => context.popView(),
          child: Container(
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
        ),
        vm.when(
          data: (data) {
            return RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: data.name.toString(),
                  style: GoogleFonts.asap(
                      color: Colors.white,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400)

                  // TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
              TextSpan(
                  text: '/',
                  style: GoogleFonts.asap(
                      color: Colors.white,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400)

                  // TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
              TextSpan(
                  text: data.symbol.toString(),
                  style: GoogleFonts.asap(
                      color: Colors.white,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400)

                  // TextStyle(color: Colors.white, fontSize: 20.sp),
                  )
            ]));
          },
          error: (Object error, StackTrace? stackTrace,
              AsyncData<CoinById>? previous) {
            print(error);
            return Text(error.toString());
          },
          loading: (AsyncValue<CoinById>? previous) {
            return const Center(child: CircularProgressIndicator());
          },
        ),
        Container(
          height: 60.h,
          width: 60.w,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
          ], shape: BoxShape.circle, color: Color(0xff201f28)),
          child: const Icon(
            Icons.share_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
