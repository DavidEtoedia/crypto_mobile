import 'package:crypto_mobile/ui/screens/widget/coin_build.dart';
import 'package:crypto_mobile/ui/vm/vm.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CryptoList extends HookConsumerWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(allCoinProvider);

    return vm.when(loading: () {
      return SizedBox(
          height: 500.h, width: 400.w, child: const LoadingAnimation());
    }, idle: () {
      return SizedBox(
          height: 400.h, width: 400.w, child: const LoadingAnimation());

      // Center(
      //   child: CircularProgressIndicator(),
      // );
    }, success: (coin) {
      return Expanded(
        child: ShaderMask(
          shaderCallback: (Rect bound) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.transparent,
                Colors.transparent,
                Colors.purple
              ],
              stops: [
                0.0,
                0.02,
                0.8,
                1.0
              ], // 10% purple, 80% transparent, 10% purple
            ).createShader(bound);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.separated(
            itemCount: coin.length,
            itemBuilder: (context, index) {
              final coins = coin[index];
              return CryptoBuild(coinList: coins);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 25.h,
              );
            },
          ),
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Center(child: Text(error.toString()));
    });
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade50,
      enabled: true,
      child: ListView.separated(
        itemCount: 7,
        itemBuilder: (_, __) {
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black26),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.black26,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.black26,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 40.0,
                    height: 8.0,
                    color: Colors.black26,
                  ),
                ],
              ))
            ],
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
