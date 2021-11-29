import 'package:crypto_mobile/core/model/coin_by_id_res.dart' as eos;
import 'package:crypto_mobile/ui/screens/exchange_list.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/ui/vm/coin_by_id.dart';
import 'package:crypto_mobile/ui/vm/trending_coin_vm.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:crypto_mobile/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:spine_project/utils/navigator.dart';

class CoinDisplayScreen extends HookConsumerWidget {
  final String coinById;
  const CoinDisplayScreen({required this.coinById, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(coinByIdProvider(coinById));
    final isEnabled = ref.watch(appThemeStateProvider);
    var format = NumberFormat("###,###", "en_US");

    bool _enableSolidCandle = false;
    return Scaffold(
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
                    return Text(
                        "\$" +
                            format.format(
                                data.marketData!.marketCap![data.symbol]),
                        style: GoogleFonts.asap(
                            color: isEnabled ? Colors.white : Colors.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w400));
                  },
                  error: (Object error, StackTrace? stackTrace,
                      AsyncData<eos.CoinById>? previous) {
                    print(error);
                    return Text(error.toString());
                  },
                  loading: (AsyncValue<eos.CoinById>? previous) {
                    return const SizedBox(
                        height: 30,
                        width: 30,
                        child: Center(child: CircularProgressIndicator()));
                  },
                ),
                SizedBox(
                  height: 45.h,
                ),
                vm.when(
                  data: (datas) {
                    final List<eos.Ticker> tickers = [
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                                  .priceChangePercentage200DInCurrency![
                              datas.symbol],
                          volume: datas
                              .marketData!.athChangePercentage![datas.symbol],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                                  .priceChangePercentage60DInCurrency![
                              datas.symbol],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas
                              .marketData!.athChangePercentage![datas.symbol],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                              .priceChangePercentage14DInCurrency!["btc"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas
                              .marketData!.atlChangePercentage![datas.symbol],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                                  .priceChangePercentage14DInCurrency![
                              datas.symbol],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas
                              .marketData!.athChangePercentage![datas.symbol],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                              .priceChangePercentage7DInCurrency![datas.symbol],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas
                              .marketData!.atlChangePercentage![datas.symbol],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                                  .priceChangePercentage200DInCurrency![
                              datas.symbol],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas
                              .marketData!.atlChangePercentage![datas.symbol],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                          last: datas.marketData!
                              .priceChangePercentage1YInCurrency![datas.symbol],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas
                              .marketData!.athChangePercentage![datas.symbol],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["ngn"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["ngn"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["ngn"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["mmk"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["mmk"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["mmk"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["lkr"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["lkr"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["lkr"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["clp"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["clp"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["clp"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["pkr"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["pkr"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["pkr"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["sar"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["sar"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["sar"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["nok"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["nok"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["nok"],
                          coinId: coinById),
                      eos.Ticker(
                          lastFetchAt: datas.marketData!.atlDate!["bhd"],
                          last: datas.marketData!
                              .priceChangePercentage60DInCurrency!["bhd"],
                          convertedVolume:
                              datas.marketData!.athChangePercentage,
                          volume: datas.marketData!.athChangePercentage!["bhd"],
                          coinId: coinById),
                    ];
                    return Container(
                      height: 300.h,
                      width: MediaQuery.of(context).size.width,
                      child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          primaryXAxis: DateTimeAxis(
                            // dateFormat: DateFormat.MMM(),
                            minimum: DateTime(2013, 01, 01),
                            maximum: DateTime(2021, 12, 30),

                            majorGridLines: const MajorGridLines(width: 0),
                            // interval: 2,
                          ),
                          primaryYAxis:
                              NumericAxis(axisLine: const AxisLine(width: 0)),
                          series: <CandleSeries<eos.Ticker, DateTime>>[
                            CandleSeries<eos.Ticker, DateTime>(
                              enableSolidCandles: _enableSolidCandle,
                              dataSource: tickers,
                              xValueMapper: (eos.Ticker data, _) =>
                                  DateFormat("yyyy-MM-DD").parse(
                                      data.lastFetchAt!.toIso8601String()),
                              lowValueMapper: (eos.Ticker data, _) => data.last,
                              highValueMapper: (eos.Ticker data, _) =>
                                  data.volume,
                              openValueMapper: (eos.Ticker data, _) =>
                                  data.convertedVolume![datas.symbol],

                              closeValueMapper: (eos.Ticker data, _) =>
                                  data.last,

                              // yValueMapper: (eos.Ticker data, _) => data.last
                            ),
                          ]),
                    );
                  },
                  error: (Object error, StackTrace? stackTrace,
                      AsyncData<eos.CoinById>? previous) {
                    print(error);
                    return Text(error.toString());
                  },
                  loading: (AsyncValue<eos.CoinById>? previous) {
                    return const SizedBox(
                        height: 250, width: 280, child: TickerLoading());
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
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
    final isEnabled = ref.watch(appThemeStateProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.popView();
            ref.refresh(allCoinProvider);
            ref.refresh(trendingCoinProvider);
          },
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(1, 1))
                ],
                shape: BoxShape.circle,
                color: isEnabled ? const Color(0xff201f28) : Colors.grey[300]),
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
                          color: isEnabled ? Colors.white : Colors.black,
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
            return const SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator());
          },
        ),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
              ],
              shape: BoxShape.circle,
              color: isEnabled ? const Color(0xff201f28) : Colors.grey[300]),
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

class TickerLoading extends HookWidget {
  const TickerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade50,
        enabled: true,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(2, 2))
            ],
          ),
        ));
  }
}
