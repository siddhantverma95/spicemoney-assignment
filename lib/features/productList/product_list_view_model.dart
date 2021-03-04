import 'package:spicemoney_ecom_assignment/core/repository.dart';
import 'package:spicemoney_ecom_assignment/models/product.dart';

class ProductListViewModel {
  DataHelperImpl _dataHelper = DataHelperImpl.instance;
  Product _product;

  Product get getProducts => _product;

  void fetchProducts() async {
    _product = Product.fromJson(await _dataHelper.apiHelper.executeLogin());
  }
}
