import 'package:adf_mobx_imc/contador/contador_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContadorPage extends StatelessWidget {
  final controller = ContadorController();

  ContadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador MobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.first);
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.last);
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.saudacao);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
