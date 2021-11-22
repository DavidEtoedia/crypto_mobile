import 'package:crypto_mobile/core/controller/generic_state_notifier.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allCoinProvider =
    StateNotifierProvider.autoDispose<AllCoinVM, RequestState>(
  (ref) => AllCoinVM(ref),
);

class AllCoinVM extends RequestStateNotifier {
  final CryptoRepository _cryptoRepository;

  AllCoinVM(ProviderRefBase ref)
      : _cryptoRepository = ref.read(cryptoProvider) {
    getCoin();
  }

  void getCoin() => makeRequest(() => _cryptoRepository.getAllCoin());
  void searchby(String id) =>
      makeRequest(() => _cryptoRepository.getAllCoin(id));
// List<String>? _categoriesFilter = [];
//  _authManager.businessType() = _categoriesFilter;
}





// final allCoinProvider = FutureProvider.autoDispose
//     .family< dynamic, String>((ref, symbol) async {
//   return ref.watch(cryptoProvider).getAllCoin(symbol = "btc");
// });

// final bankTypeProvider = FutureProvider.autoDispose
//     .family<List<Banklist>, String>((ref, searchBy) async {
//   return ref.watch(getBankProvider).getAllBanks(searchBy);
// });
// final allCoinProvider = FutureProvider.autoDispose
// .family<Cr>

// final allCoinProvider = StateNotifierProvider.autoDispose<CoinListVM,
//     RequestState<CryptoListRes>>(
//   (ref) => CoinListVM(ref),
// );

// class CoinListVM extends RequestStateNotifier<CryptoListRes> {
//   final CryptoRepository _cryptoRepository;

//   CoinListVM(ProviderRefBase ref)
//       : _cryptoRepository = ref.read(cryptoProvider) {
//     // getAllcoins();
//   }

//   // void getAllcoins() => makeRequest(() => _cryptoRepository.getAllcoin(symbol));
//   void searchByCustomer(String symbol) =>
//       makeRequest(() => _cryptoRepository.getAllcoin(symbol));
// }

// final allCoinProvider = StateNotifierProvider<CoinVM, RequestState>(
//   (ref) => CoinVM(ref),
// );

// class CoinVM extends RequestStateNotifier<List> {
//   final CryptoRepository _cryptoRepository;

//   CoinVM(ProviderRefBase ref) : _cryptoRepository = ref.read(cryptoProvider);

//   void getAllCoins([String symbol = "btc"]) =>
//       makeRequest(() => _cryptoRepository.getAllCoin(symbol));
// }
