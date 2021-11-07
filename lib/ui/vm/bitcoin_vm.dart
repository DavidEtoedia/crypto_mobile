import 'package:crypto_mobile/core/controller/generic_state_notifier.dart';
import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bitCoinProvider = StateNotifierProvider<ExchangeListVM, RequestState>(
  (ref) => ExchangeListVM(ref),
);

class ExchangeListVM extends RequestStateNotifier {
  final CryptoRepository _cryptoRepository;

  ExchangeListVM(ProviderRefBase ref)
      : _cryptoRepository = ref.read(cryptoProvider) {
    getBitCoins();
  }

  void getBitCoins([String bitcoin = 'bitcoin']) =>
      makeRequest(() => _cryptoRepository.getBitCoin(bitcoin));
}
