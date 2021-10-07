import 'package:crypto_mobile/core/model/get_crypto_list.dart';

abstract class ICryptoRepository {
  Future<List<CryptoListRes>> getAllcoin(String symbol);
  // Future<String> createCustomer(CustomerCreateDto customerCreateDto);
  // Future<GetCustomerRes> getCustomer([String searchBy]);
  // Future<bool> updateCustomer(UpdateCustomer updateCustomer);
  // Future<GetAllCustomerById> getAllCustomerById(String customerId);
  // Future<bool> uploadFile(String filePath);
}
