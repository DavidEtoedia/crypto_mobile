import 'package:crypto_mobile/core/model/coin_by_id_res.dart';
import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/core/model/trending_coin.dart';

abstract class ICryptoRepository {
  Future getAllCoin([String ids = '']);
  Future searchCoin([String id]);
  Future<TrendingCoin> trendingCoin();

  Future<CoinById> getCoinbyId(String coinById);
  Future<List<Exchanges>> getExchanges();
  Future getBitCoin([String bitcoin = 'bitcoin']);

  // Future<String> createCustomer(CustomerCreateDto customerCreateDto);
  // Future<GetCustomerRes> getCustomer([String searchBy]);
  // Future<bool> updateCustomer(UpdateCustomer updateCustomer);
  // Future<GetAllCustomerById> getAllCustomerById(String customerId);
  // Future<bool> uploadFile(String filePath);
}
