// import 'dart:io';

import 'package:crypto_mobile/core/model/get_crypto_list.dart';
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
  Future<List<CryptoListRes>> getAllcoin(String symbol) async {
    return await _cryptoService.getAllcoin(symbol);
  }

  //
  // @override
  // Future<String> createCustomer(CustomerCreateDto customerCreateDto) async {
  //   return await _customerService.createCustomer(customerCreateDto);
  // }

  // @override
  // Future<GetCustomerRes> getCustomer([String searchBy = '']) async {
  //   return await _customerService.getCustomer(searchBy);
  // }

  // @override
  // Future<bool> updateCustomer(UpdateCustomer updateCustomer) async {
  //   return await _customerService.updateCustomer(updateCustomer);
  // }

  // @override
  // Future<GetAllCustomerById> getAllCustomerById(String customerId) async {
  //   return await _customerService.getAllCustomerById(customerId);
  // }

  // @override
  // Future<bool> uploadFile(String filePath) async {
  //   final res = await _customerService.uploadFile(filePath);
  //   return res;
  // }

  // @override
  // Future<GetAllCustomerById> addCustomerNote(
  //     String customerId, String note) async {
  //   return await _customerService.addCustomerNote(customerId, note);
  // }

  // @override
  // Future<GetAllCustomer> getAllCustomer((String customerId)) async {
  //   return await _customerService.getAllCustomer((customerId);
  // }

  // @override
  // Future<List<GetAllCustomer>> getAllCustomer(
  //     GetAllCustomer getAllCustomer) async {
  //   return await _customerService.getAllCustomer(getAllCustomer);
  // }

  // @override
  // Future<GetAllCustomer> getAllCustomer(GetAllCustomer getAllCustomer) async {
  //   return await _customerService.getAllCustomer(getAllCustomer);
  // }
}
