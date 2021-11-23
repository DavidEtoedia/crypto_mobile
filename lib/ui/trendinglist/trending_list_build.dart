import 'package:crypto_mobile/core/model/trending_coin.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 30, right: 0),
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
                        const Text(
                          "Rank",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          coin.score.toString(),
                          style: const TextStyle(
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
