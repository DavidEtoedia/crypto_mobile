// import 'dart:io';

import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/model/trending_coin.dart';
import 'package:crypto_mobile/core/repository/i_crypto_repository.dart';
import 'package:crypto_mobile/core/services/Crypto%20Service/crypto_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cryptoProvider = Provider<CryptoRepository>((ref) {
  final cryptoService = ref.watch(cryptoServiceProvider);

  return CryptoRepository(cryptoService);
});

class CryptoRepository extends ICryptoRepository {
  final CryptoService _cryptoService;
  CryptoRepository(this._cryptoService);

  @override
  Future getAllCoin([
    String ids = '',
  ]) async {
    final coinList = await _cryptoService.getAllCoin(
      ids,
    );
    return coinList;
  }

  @override
  Future<List<Exchanges>> getExchanges() async {
    return await _cryptoService.getExchanges();
  }

  @override
  Future<CoinById> getCoinbyId(String coinById) async {
    return await _cryptoService.getCoinbyId(coinById);
  }

  @override
  Future getBitCoin([String bitcoin = 'bitcoin']) async {
    return await _cryptoService.getBitCoin(bitcoin);
  }

  @override
  Future searchCoin([String id = '']) async {
    return await _cryptoService.getAllCoin(id);
  }

  @override
  Future<TrendingCoin> trendingCoin() async {
    return await _cryptoService.trendingCoin();
  }
}
