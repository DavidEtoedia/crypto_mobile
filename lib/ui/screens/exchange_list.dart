import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/ui/vm/excchange_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ExchangeScreen extends HookConsumerWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(exchangeListProvider);
    return vm.when(idle: () {
      return const Center(
        child: Loading(),
      );
    }, loading: () {
      return SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: const Loading(),
      );
    }, success: (data) {
      return SizedBox(
        height: 220,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: data!.length,
            itemBuilder: (context, index) {
              final exdata = data[index];
              return ExchangeBuild(
                exchanges: exdata,
              );
            }),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Text(error.toString());
    });
  }
}

class ExchangeBuild extends HookConsumerWidget {
  final Exchanges exchanges;
  const ExchangeBuild({Key? key, required this.exchanges}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(appThemeStateProvider);
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isEnabled ? const Color(0xff201f28) : Colors.grey[300]),
      height: 55,
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.network(exchanges.image!),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              exchanges.name!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class Loading extends HookWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade50,
      enabled: true,
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (_, __) {
          return Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 15.h,
          );
        },
      ),
    );
  }
}
