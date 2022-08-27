// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adf_mobx_imc/model/product_model.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {
  @observable
  ProductModel product;
  @observable
  bool selected;

  ProductStoreBase({
    required this.product,
    required this.selected,
  });
}
