import 'package:crypto_mobile/core/model/exchanges.dart';
import 'package:crypto_mobile/core/model/get_crypto_list.dart';

abstract class ICryptoRepository {
  Future getAllCoin([String symbol = "btc"]);
  Future<List<Exchanges>> getExchanges();
  // Future<String> createCustomer(CustomerCreateDto customerCreateDto);
  // Future<GetCustomerRes> getCustomer([String searchBy]);
  // Future<bool> updateCustomer(UpdateCustomer updateCustomer);
  // Future<GetAllCustomerById> getAllCustomerById(String customerId);
  // Future<bool> uploadFile(String filePath);
}
