import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto_mobile/core/controller/generic_state_notifier.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final getCoinProvider =
//     StateNotifierProvider.autoDispose<NewAllCoinVM, RequestState>(
//   (ref) => NewAllCoinVM(ref),
// );

// class NewAllCoinVM extends RequestStateNotifier {
//   final CryptoRepository _cryptoRepository;

//   NewAllCoinVM(ProviderRefBase ref)
//       : _cryptoRepository = ref.read(cryptoProvider) {
//     getCoinById();
//   }

//   void getCoinById() => makeRequest(() => _cryptoRepository.getCoinbyId());
// // List<String>? _categoriesFilter = [];
// //  _authManager.businessType() = _categoriesFilter;
// }

final coinByIdProvider =
    FutureProvider.autoDispose.family<CoinById, String>((ref, coinById) async {
  return ref.watch(cryptoProvider).getCoinbyId(coinById);
});
