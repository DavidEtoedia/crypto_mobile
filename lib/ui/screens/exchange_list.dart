import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/ui/vm/excchange_vm.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExchangeScreen extends HookConsumerWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(exchangeListProvider);
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

class ExchangeBuild extends StatelessWidget {
  final Exchanges exchanges;
  const ExchangeBuild({Key? key, required this.exchanges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff201f28),
      ),
      height: 55,
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.network(exchanges.image!),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              exchanges.name!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
