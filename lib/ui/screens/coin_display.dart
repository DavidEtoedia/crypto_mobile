import 'package:crypto_mobile/core/model/coin_by_id_res.dart' as eos;
import 'package:crypto_mobile/ui/screens/exchange_list.dart';
import 'package:crypto_mobile/ui/vm/coin_by_id.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:crypto_mobile/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                  AsyncData<eos.CoinById>? previous) {
                print(error);
                return Text(error.toString());
              },
              loading: (AsyncValue<eos.CoinById>? previous) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: 70.h,
            ),
            vm.when(
              data: (data) {
                final List<eos.Ticker> tickers = [
                  eos.Ticker(
                      last: data.marketData!.priceChangePercentage30D,
                      volume: 10,
                      coinId: coinById),
                  eos.Ticker(
                      last: data.marketData!.priceChangePercentage14D,
                      volume: 20,
                      coinId: coinById),
                  eos.Ticker(
                      last: data.marketData!.priceChangePercentage200D,
                      volume: 30,
                      coinId: coinById),
                  eos.Ticker(
                      last: data.marketData!.priceChangePercentage60D,
                      volume: 40,
                      coinId: coinById),
                  eos.Ticker(
                      last: data.marketData!.priceChangePercentage7D,
                      volume: 50,
                      coinId: coinById),
                  eos.Ticker(
                      last: data.marketData!.priceChangePercentage24H,
                      volume: 60,
                      coinId: coinById),
                  eos.Ticker(
                      last: data.marketData!.priceChange24H,
                      volume: 60,
                      coinId: coinById),
                ];
                return Container(
                  height: 300.h,
                  width: 350.w,
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <FastLineSeries<eos.Ticker, dynamic>>[
                        FastLineSeries<eos.Ticker, dynamic>(
                            dataSource: tickers,
                            xValueMapper: (eos.Ticker data, _) =>
                                data.volume.toString(),
                            yValueMapper: (eos.Ticker data, _) => data.last),
                      ]),
                );
              },
              error: (Object error, StackTrace? stackTrace,
                  AsyncData<eos.CoinById>? previous) {
                print(error);
                return Text(error.toString());
              },
              loading: (AsyncValue<eos.CoinById>? previous) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: 20,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  child: const Center(
                    child: Text(
                      'Buy',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent[400]),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 40,
                  width: 120,
                  child: const Center(
                    child: Text(
                      'Sell',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent[200]),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const ExchangeScreen()
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
          onTap: () {
            context.popView();
            ref.refresh(allCoinProvider);
          },
          child: Container(
            height: 40.h,
            width: 40.w,
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
            return Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.network(data.image!.large.toString())),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: data.name.toString(),
                      style: GoogleFonts.asap(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400)

                      // TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                ])),
              ],
            );
          },
          error: (Object error, StackTrace? stackTrace,
              AsyncData<eos.CoinById>? previous) {
            print(error);
            return Text(error.toString());
          },
          loading: (AsyncValue<eos.CoinById>? previous) {
            return const Center(child: CircularProgressIndicator());
          },
        ),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
          ], shape: BoxShape.circle, color: Color(0xff201f28)),
          child: const Icon(
            Icons.share_outlined,
            color: Colors.white,
            size: 20,
          ),
        )
      ],
    );
  }
}
