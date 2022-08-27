import 'package:adf_mobx_imc/contador_codegen/contador_codegen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ContadorCodeGenPage extends StatefulWidget {
  ContadorCodeGenPage({Key? key}) : super(key: key);

  @override
  _ContadorCodeGenPageState createState() => _ContadorCodeGenPageState();
}

class _ContadorCodeGenPageState extends State<ContadorCodeGenPage> {
  final controller = ContadorCodeGenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    // Esse AutoRun fica escutando as variáveis que estão sendo usadas dentro dele
    // e também roda logo quando é criado

    final autorunDisposer = autorun((_) {
      print('---------------AutoRun---------------');
      print(controller.fullName.first);
      // print(controller.fullName.last);
    });
    // No reaction nós falamos para o mobx qual o atributo queremos observar
    final rDisposer = reaction((_) => controller.counter, (counter) {
      print('----------------reaction----------------');
      print(counter);
    });

    final whenDisposer =
        when((_) => controller.fullName.first == 'Elcinho', () {
      print('----------------When----------------');
      print(controller.fullName.first);
    });

    reactionDisposer.add(autorunDisposer);
    reactionDisposer.add(rDisposer);
    reactionDisposer.add(whenDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer.forEach((reaction) => reaction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador MobX CodeGen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
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
            ),
            TextButton(
              onPressed: () => controller.changeName(),
              child: Text('Change Name'),
            ),
            TextButton(
              onPressed: () => controller.rollbackName(),
              child: Text('Rollback Name'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
