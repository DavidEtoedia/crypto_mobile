import 'package:crypto_mobile/ui/screens/widget/coin_build.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoList extends HookConsumerWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(allCoinProvider);

    return vm.when(loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, idle: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, success: (coin) {
      return Expanded(
        child: ListView.separated(
          itemCount: coin.length,
          itemBuilder: (context, index) {
            final coins = coin[index];
            return CryptoBuild(coinList: coins);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 20.h,
            );
          },
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Center(child: Text(error.toString()));
    });
  }
}
