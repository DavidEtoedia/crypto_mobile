import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/ui/screens/coin_display.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CryptoBuild extends HookConsumerWidget {
  final CryptoListRes coinList;
  const CryptoBuild({Key? key, required this.coinList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    var format = NumberFormat("###,###", "en_US");
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: InkWell(
        onTap: () => context.navigate(CoinDisplayScreen(
          coinById: coinList.id!,
        )),
        child: Row(
          children: [
            Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(1, 1))
                  ],
                  shape: BoxShape.circle,
                  color:
                      isEnabled ? const Color(0xff201f28) : Colors.grey[300]),
              child: Container(
                margin: EdgeInsets.all(10.w),
                height: 40.h,
                width: 40.w,
                child: Image.network(coinList.image!),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coinList.name!,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: isEnabled ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  coinList.symbol!.toUpperCase(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$" + format.format(coinList.marketCap),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: isEnabled ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    coinList.marketCapChangePercentage24H! > 0.0
                        ? Icon(
                            Icons.arrow_drop_up_outlined,
                            color: Colors.greenAccent[400],
                          )
                        : const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.red,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.5),
                      child: Text(
                          coinList.marketCapChangePercentage24H!
                                  .toStringAsFixed(1) +
                              '%',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: coinList.marketCapChangePercentage24H! > 0.0
                                ? Colors.greenAccent[400]
                                : Colors.red,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
