import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/model/trending_coin.dart';
import 'package:crypto_mobile/core/services/api_interceptor.dart';
import 'package:crypto_mobile/core/services/error_interceptor.dart';
import 'package:crypto_mobile/core/services/failure.dart';
import 'package:crypto_mobile/core/services/global/constants.dart';
import 'package:crypto_mobile/ui/home_page.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final cryptoServiceProvider = Provider<CryptoService>((ref) {
  return CryptoService(ref.watch(dioProvider));
});

final dioProvider = Provider((ref) => Dio(BaseOptions(
    receiveTimeout: 100000,
    connectTimeout: 100000,
    // contentType: "application/json-patch+json",
    baseUrl: Constants.apiBaseUrl)));

class CryptoService {
  final Dio _dio;
  CryptoService(this._dio) {
    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future getAllCoin([String ids = '']) async {
    final url = 'v3/coins/markets?vs_currency=btc&ids=$ids';
    final queryParameters = {"ids": ids};
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      final res = List<CryptoListRes>.from(
          response.data.map((x) => CryptoListRes.fromJson(x)));

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != 'btc') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<List<Exchanges>> getExchanges() async {
    const url = 'v3/exchanges';
    // final queryParameters = {
    //   "btc": symbol,
    // };
    try {
      final response = await _dio.get(
        url,
        // queryParameters: queryParameters,
      );
      final res =
          List<Exchanges>.from(response.data.map((x) => Exchanges.fromJson(x)));
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future getCoinbyId(String coinById) async {
    final url = 'v3/coins/$coinById';
    // final queryParameters = {
    //   "btc": symbol,
    // };
    try {
      final response = await _dio.get(
        url,

        // queryParameters: queryParameters,
      );
      final res =
          // response.data;

          CoinById.fromJson(response.data);

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future getBitCoin([String bitcoin = 'bitcoin']) async {
    final url = 'v3/coins/$bitcoin';
    final queryParameters = {
      "id": bitcoin,
    };
    try {
      final response = await _dio.get(
        url,

        // queryParameters: queryParameters,
      );
      final res =
          // response.data;

          CoinById.fromJson(response.data);

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<TrendingCoin> trendingCoin() async {
    const url = 'v3/search/trending';

    try {
      final response = await _dio.get(
        url,
      );
      final res =
          // response.data;

          TrendingCoin.fromJson(response.data);

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }
}
