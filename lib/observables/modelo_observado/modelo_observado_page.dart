import 'package:adf_mobx_imc/observables/modelo_observado/modelo_observado_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ModeloObservadoPage extends StatefulWidget {
  const ModeloObservadoPage({Key? key}) : super(key: key);

  @override
  State<ModeloObservadoPage> createState() => _ModeloObservadoPageState();
}

class _ModeloObservadoPageState extends State<ModeloObservadoPage> {
  final controller = ModeloObservadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ModeloObservadoPage'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) {
                  print('Lista assa sdfdfgd');
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final productStore = controller.products[index];
                      return Observer(
                        builder: (_) {
                          print(
                              'Item carregado foi ${productStore.product.name}');
                          return CheckboxListTile(
                            value: productStore.selected,
                            onChanged: (_) {
                              controller.selectedProduct(index);
                            },
                            title: Text(productStore.product.name),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.addProduct();
                    },
                    child: const Text('Adicionar')),
                TextButton(
                    onPressed: () {
                      controller.removeProduct();
                    },
                    child: const Text('Remover')),
                TextButton(
                    onPressed: () {
                      controller.loadProducts();
                    },
                    child: const Text('Carregar')),
              ],
            )
          ],
        ));
  }
}
