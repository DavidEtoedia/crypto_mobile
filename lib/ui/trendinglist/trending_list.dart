import 'package:crypto_mobile/ui/trendinglist/trending_list_build.dart';
import 'package:crypto_mobile/ui/vm/trending_coin_vm.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        width: MediaQuery.of(context).size.width,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.purple,
                Colors.transparent,
                Colors.transparent,
                Colors.purple
              ],
              stops: [
                0.0,
                0.09,
                0.9,
                1.0
              ], // 10% purple, 80% transparent, 10% purple
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: value!.coins!.length,
            itemBuilder: (context, index) {
              final coin = value.coins![index];
              return TrendingCardBuild(coin: coin.item!);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 0,
              );
            },
          ),
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Text(error.toString());
    });
  }
}
