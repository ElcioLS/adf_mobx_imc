import 'package:mobx/mobx.dart';

import '../../model/product_model.dart';

part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase
    with _$ObservableListController;

abstract class ObservableListControllerBase with Store {
  @observable
  var products = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Monitor'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Mouse'),
      ProductModel(name: 'Estabilizador'),
    ];
    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(ProductModel(name: 'Computador'));
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }
}



// //  Método sem Observable (ERRADO não faz sentido utilizar assim)
// import 'package:mobx/mobx.dart';
// import '../../model/product_model.dart';
// part 'observable_list_controller.g.dart';

// class ObservableListController = ObservableListControllerBase
//     with _$ObservableListController;

// abstract class ObservableListControllerBase with Store {
//   @observable
//   var products = <ProductModel>[]; // " Método Sem observable list"
//     @action
//   void loadProducts() {
//     var productsData = [ProductModel(name: 'Computador'), ProductModel(name: 'Monitor'), ProductModel(name: 'Teclado')];
//     products = productsData; // " Método Sem observable list"
//   }
//   @action
//   void addProduct() {
//     var productsNew = [...products]; // criar variavel e um destruction " Método Sem observable list"
//     productsNew.add(ProductModel(name: 'Computador')); // "Método Sem observable list"
//     products = productsNew; // "Método Sem observable list"
//   }
//   @action
//   void removeProduct() {
//     products.removeAt(0);
//   }
// }
