import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/ui/vm/bitcoin_vm.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TopDisplay extends HookConsumerWidget {
  const TopDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(bitCoinProvider);

    return vm.when(idle: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, success: (data) {
      return TopText(coin: data);
    }, error: (Object error, StackTrace stackTrace) {
      return Text(error.toString());
    });
  }
}

class TopText extends StatelessWidget {
  final CoinById coin;
  const TopText({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###,###.0#", "en_US");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market Cap',
                style: GoogleFonts.asap(
                    color: Colors.grey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text(
                "\$" +
                    coin.marketData!.marketCapChangePercentage24H!
                        .toStringAsFixed(1) +
                    'B',
                style: GoogleFonts.asap(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600)

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
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text(
                '\$' +
                    coin.marketData!.priceChangePercentage24H!
                        .toStringAsFixed(1) +
                    "%",
                style: GoogleFonts.asap(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600)

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
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text(coin.publicInterestScore!.toStringAsFixed(2) + "%",
                style: GoogleFonts.asap(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600)

                // TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
          ],
        ),
      ],
    );
  }
}
