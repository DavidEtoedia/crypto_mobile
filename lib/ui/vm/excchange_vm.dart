import 'package:crypto_mobile/core/controller/generic_state_notifier.dart';
import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exchangeListProvider =
    StateNotifierProvider<ExchangeListVM, RequestState>(
  (ref) => ExchangeListVM(ref),
);

class ExchangeListVM extends RequestStateNotifier<List> {
  final CryptoRepository _cryptoRepository;

  ExchangeListVM(ProviderRefBase ref)
      : _cryptoRepository = ref.read(cryptoProvider) {
    getExchange();
  }

  void getExchange() => makeRequest(() => _cryptoRepository.getExchanges());
  void searchByCustomer(String searchBy) =>
      makeRequest(() => _cryptoRepository.getExchanges());
}

// final itemListProvider = FutureProvider.autoDispose.
//     <List<Exchanges> async {
//   return ref.watch(inventoryProvider).getItem(searchBy);
// });
