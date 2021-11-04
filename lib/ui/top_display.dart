import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopDisplay extends HookConsumerWidget {
  const TopDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(allCoinProvider);

    return vm.when(idle: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, success: (data) {
      return SizedBox(
        height: 30,
        width: 300,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data!.length,
            itemBuilder: (context, index) {
              final coinss = data[index];
              return TopText(coin: coinss);
            }),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Text(error.toString());
    });
  }
}

class TopText extends StatelessWidget {
  final CryptoListRes coin;
  const TopText({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(coin.name!,
            style: GoogleFonts.asap(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400)

            // TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
        SizedBox(
          width: 10,
        ),
        Text(coin.symbol!,
            style: GoogleFonts.asap(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400)

            // TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
      ],
    );
  }
}
