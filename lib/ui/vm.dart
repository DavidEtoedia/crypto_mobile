import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allCustomerProvider = FutureProvider.autoDispose
    .family<List<CryptoListRes>, String>((ref, symbol) async {
  return ref.watch(cryptoProvider).getAllcoin(symbol);
});
