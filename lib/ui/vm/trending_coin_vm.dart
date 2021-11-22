import 'package:crypto_mobile/core/controller/generic_state_notifier.dart';
import 'package:crypto_mobile/core/model/trending_coin.dart';
import 'package:crypto_mobile/core/repository/crypto_repository.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final trendingCoinProvider = StateNotifierProvider.autoDispose<TrendingCoinVM,
    RequestState<TrendingCoin>>(
  (ref) => TrendingCoinVM(ref),
);

class TrendingCoinVM extends RequestStateNotifier<TrendingCoin> {
  final CryptoRepository _cryptoRepository;

  TrendingCoinVM(ProviderRefBase ref)
      : _cryptoRepository = ref.read(cryptoProvider) {
    trendCoin();
  }

  void trendCoin() => makeRequest(() => _cryptoRepository.trendingCoin());
}

// final allNewsArticleProvider =
//     StateNotifierProvider.autoDispose<NewsArticleVM, RequestState<NewArticle>>(
//   (ref) => NewsArticleVM(ref),
// );
// final trendingCoinProvider = StateNotifierProvider.autoDispose<NewsArticleVM,
//     RequestState<TrendingCoin>>(
//   (ref) => NewsArticleVM(ref),
// );

// class NewsArticleVM extends RequestStateNotifier<TrendingCoin> {
//   final CryptoRepository _cryptoRepository;

//   NewsArticleVM(ref) : _cryptoRepository = ref.read(cryptoProvider) {
//     trendingCoin();
//   }
//   void trendingCoin() => makeRequest(() => _cryptoRepository.trendingCoin());
// }
