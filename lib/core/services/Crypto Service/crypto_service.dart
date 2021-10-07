import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/services/api_interceptor.dart';
import 'package:crypto_mobile/core/services/error_interceptor.dart';
import 'package:crypto_mobile/core/services/failure.dart';
import 'package:crypto_mobile/core/services/global/constants.dart';
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

  Future<List<CryptoListRes>> getAllcoin(String symbol) async {
    const url =
        'v3/coins/markets?vs_currency=btc&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    final queryParameters = {
      'coinId': symbol,
    };
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      final res = cryptoListResFromJson(response.data);
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
//   Future<bool> createItem(AddItem addItem) async {
//     const url = 'Product';
//     try {
//       final response = await _dio.post(url,
//           data: addItem.toJson(),
//           options: Options(headers: {"requireToken": true}));
//       final result = response.data = true;
//       return result;
//     } on DioError catch (e) {
//       if (e.response != null && e.response!.data != '') {
//         Failure result = Failure.fromJson(e.response!.data);
//         // throw result.message!;
//         throw result;
//       } else {
//         print(e.error);
//         throw e.error;
//       }
//     }
//   }

//   Future<List<GetItemRes>> getItem([String searchBy = '']) async {
//     const url = 'Product/slim';
//     var queryParameters = {"Search": searchBy};
//     try {
//       final response = await _dio.get(url,
//           queryParameters: queryParameters,
//           options: Options(headers: {"requireToken": true}));
//       final result = getItemResFromJson(response.data);
//       return result;
//     } on DioError catch (e) {
//       if (e.response != null && e.response!.data != '') {
//         Failure result = Failure.fromJson(e.response!.data);
//         // throw result.message!;
//         throw result;
//       } else {
//         print(e.error);
//         throw e.error;
//       }
//     }
//   }

//   Future<List<InventoryList>> getList([String searchBy = '']) async {
//     const url = 'Inventory/slim';
//     var queryParameters = {"Search": searchBy};
//     try {
//       final response = await _dio.get(url,
//           queryParameters: queryParameters,
//           options: Options(headers: {"requireToken": true}));
//       final result = inventoryListFromJson(response.data);
//       return result;
//     } on DioError catch (e) {
//       if (e.response != null && e.response!.data != '') {
//         Failure result = Failure.fromJson(e.response!.data);
//         // throw result.message!;
//         throw result;
//       } else {
//         print(e.error);
//         throw e.error;
//       }
//     }
//   }

//   Future<bool> addCategory(AddCategoryRes addCategoryRes) async {
//     const url = 'Product/categories';
//     try {
//       final response = await _dio.post(url,
//           data: addCategoryRes.toJson(),
//           options: Options(headers: {"requireToken": true}));
//       final result = response.data = true;
//       return result;
//     } on DioError catch (e) {
//       if (e.response != null && e.response!.data != '') {
//         Failure result = Failure.fromJson(e.response!.data);
//         // throw result.message!;
//         throw result;
//       } else {
//         print(e.error);
//         throw e.error;
//       }
//     }
//   }

//   Future<List<GetCategoryRes>> getCategory([String searchBy = '']) async {
//     const url = 'Product/categories/slim';
//     var queryParameters = {"Search": searchBy};
//     try {
//       final response = await _dio.get(url,
//           queryParameters: queryParameters,
//           options: Options(headers: {"requireToken": true}));
//       final result = getCategoryResFromJson(response.data);
//       return result;
//     } on DioError catch (e) {
//       if (e.response != null && e.response!.data != '') {
//         Failure result = Failure.fromJson(e.response!.data);
//         // throw result.message!;
//         throw result;
//       } else {
//         print(e.error);
//         throw e.error;
//       }
//     }
//   }
// }

}
