import 'package:crypto_mobile/core/controller/generic_state_notifier.dart';
import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exchangeListProvider = StateNotifierProvider.autoDispose<ExchangeListVM,
    RequestState<List<Exchanges>>>(
  (ref) => ExchangeListVM(ref),
);

class ExchangeListVM extends RequestStateNotifier<List<Exchanges>> {
  final CryptoRepository _cryptoRepository;

  ExchangeListVM(ProviderRefBase ref)
      : _cryptoRepository = ref.read(cryptoProvider) {
    getExchange();
  }

  void getExchange() => makeRequest(() => _cryptoRepository.getExchanges());
}
